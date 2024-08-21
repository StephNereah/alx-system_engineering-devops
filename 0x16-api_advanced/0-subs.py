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
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) \
        Gecko/20100401 Firefox/3.6.3 (FM Scene 4.6.1)'
    }
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        return response.json().get('data', {}).get('subscribers', 0)
    else:
        return 0
