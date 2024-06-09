from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from utility.script.script_generator import generate_script
from utility.audio.audio_generator import generate_audio
from utility.captions.timed_captions_generator import generate_timed_captions
from utility.video.background_video_generator import generate_video_url
from utility.render.render_engine import get_output_media
from utility.video.video_search_query_generator import getVideoSearchQueriesTimed, merge_empty_intervals
import asyncio

app = FastAPI()

class TopicRequest(BaseModel):
    topic: str

@app.post("/generate_video")
async def generate_video(request: TopicRequest):
    SAMPLE_TOPIC = request.topic
    SAMPLE_FILE_NAME = "audio_tts.wav"
    VIDEO_SERVER = "pexel"

    try:
        # Generate script
        response = generate_script(SAMPLE_TOPIC)
        print("script: {}".format(response))

        # Generate audio
        await asyncio.run(generate_audio(response, SAMPLE_FILE_NAME))

        # Generate timed captions
        timed_captions = generate_timed_captions(SAMPLE_FILE_NAME)
        print(timed_captions)

        # Generate video search terms
        search_terms = getVideoSearchQueriesTimed(response, timed_captions)
        print(search_terms)

        background_video_urls = None
        if search_terms is not None:
            background_video_urls = generate_video_url(search_terms, VIDEO_SERVER)
            print(background_video_urls)
        else:
            print("No background video")

        # Merge empty intervals in background videos
        background_video_urls = merge_empty_intervals(background_video_urls)

        # Generate final video
        if background_video_urls is not None:
            video = get_output_media(SAMPLE_FILE_NAME, timed_captions, background_video_urls, VIDEO_SERVER)
            print(video)
            return {"video_url": video}
        else:
            print("No video")
            return {"error": "No video could be generated"}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
