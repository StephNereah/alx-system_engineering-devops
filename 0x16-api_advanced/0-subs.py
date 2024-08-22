#!/usr/bin/python3
"""
Module:
function number_of_subscribers(subreddit) that queries the Reddit API
and returns the number of subscribers for a given subreddit.
Return 0 if the subreddit is invalid.
"""
import requests

def number_of_subscribers(subreddit):
    """Queries the Reddit API for number of subscribers."""
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        return 0

    data = response.json().get("data")
    subs = data.get("subscribers", 0)

    return subs
