select review_test, analyse_sentiment(review_test) from reviews_test
CREATE or replace function analyse_sentiment (text string)
returns string 
language python
runtime_version = '3.8'
packages = ('textblob')
handler = 'sentiment_analyzer'
as $$
from textblob import TextBlob
def sentiment_analyzer (text):
    analysis = TextBlob(text)
    if analysis.sentiment.polarity>0:
        return 'Positive'
    elif analysis.sentiment.polarity==0:
        return 'Neutral'
    else:
        return 'Negative'
$$;
