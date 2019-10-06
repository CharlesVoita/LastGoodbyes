using System.Collections;
using Ink.Runtime;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class InkTestingScript : MonoBehaviour
{
    public TextAsset inkJSON;
    private Story story;

    public TextMeshProUGUI textPrefab;
    public Button buttonPrefab;

    [Header("All the Arts")] public GameObject oldMan;
    public GameObject synthiaYoung, synthiaAdult, angela, bob, lydiaBreakupBefore, lydiaBreakupAfter, lydiaHug;

    [Header("Music")] 
    public AudioSource DroneSong;
    public AudioSource BassSong, LydiaSong, SynthiaSong;
    
    private GameObject activeObj;

    [Header("Other")]
    public CameraControl CameraControl;
    
    
    
   
    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSON.text);
        activeObj = oldMan;

        var storyText = Instantiate(textPrefab);
        storyText.transform.SetParent(transform, false);
        getStoryChoices();
        refreshUI();

    }

    void fadeTo(GameObject toObj)
    {
        StartCoroutine(FadeTo(activeObj, 1f, 0f, 1f));
        StartCoroutine(FadeTo(toObj, 0f, 1f, 1f, 1f));
        activeObj = toObj;
    }
    
    void refreshUI()
    {

        eraseUI();

        var storyText = Instantiate(textPrefab);
        
        var inkText = loadStoryChunk();
        var tags = story.currentTags;
        
        if (tags.Count > 0) {
            if ( tags[0] != "") {
                inkText = tags[0] + ":\n" + inkText;
            }

            if (tags.Count >= 2) {
                HandleAnimationTag(tags[1]);
            }
        }

        storyText.text = inkText;
        storyText.transform.SetParent(transform, false);
        getStoryChoices();
    }

    void HandleAnimationTag(string animTag)
    {
        if (animTag == "SynthiaYoung") {
            StartCoroutine(FadeMusic(SynthiaSong, .1f, .4f));
            StartCoroutine(FadeMusic(BassSong, 1f, .4f));
            StartCoroutine(FadeMusic(LydiaSong, 0f, .2f));
            fadeTo(synthiaYoung);
        } else if (animTag == "SynthiaAdult") {
            StartCoroutine(FadeMusic(SynthiaSong, .1f, .4f));
            StartCoroutine(FadeMusic(BassSong, 1f, .4f));
            StartCoroutine(FadeMusic(LydiaSong, 0f, .2f));
            fadeTo(synthiaAdult);
        } else if (animTag == "Bob") {
            StartCoroutine(FadeMusic(SynthiaSong, 0f, .2f));
            StartCoroutine(FadeMusic(BassSong, 1f, .4f));
            StartCoroutine(FadeMusic(LydiaSong, 0f, .2f));
            fadeTo(bob);
        } else if (animTag == "LydiaBefore") {
            StartCoroutine(FadeMusic(SynthiaSong, 0f, .4f));
            StartCoroutine(FadeMusic(BassSong, 1f, .4f));
            StartCoroutine(FadeMusic(LydiaSong, .12f, .4f));
            fadeTo(lydiaBreakupBefore);
        } else if (animTag == "LydiaAfter") {
            StartCoroutine(FadeMusic(SynthiaSong, 0f, .4f));
            StartCoroutine(FadeMusic(BassSong, 1f, .4f));
            StartCoroutine(FadeMusic(LydiaSong, .1f, .4f));
            fadeTo(lydiaBreakupAfter);
        } else if (animTag == "HoldLydia") {
            StartCoroutine(FadeMusic(SynthiaSong, 0f, .2f));
            StartCoroutine(FadeMusic(BassSong, 0f, .8f));
            StartCoroutine(FadeMusic(LydiaSong, .14f, .4f));
            fadeTo(lydiaHug);
        } else if (animTag == "Angela") {
            StartCoroutine(FadeMusic(SynthiaSong, 0f, .2f));
            StartCoroutine(FadeMusic(BassSong, 1f, .4f));
            StartCoroutine(FadeMusic(LydiaSong, 0f, .2f));
            fadeTo(angela);
        }else if (animTag == "EndGame") {
            CameraControl.EndGame();
        }
    }

    void eraseUI()
    {
        for(var i = 0; i < transform.childCount; i++)
        {
            Destroy(transform.GetChild(i).gameObject);
        }
    }


    private string loadStoryChunk()
    {
        var text = "";
        if (story.canContinue) {
            text = story.ContinueMaximally();
        }
        return text;
    }


    void chooseStoryChoice(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        refreshUI();
    }

    private void getStoryChoices()
    {
        foreach (var choice in story.currentChoices) {
            var choiceButton = Instantiate(buttonPrefab);
            choiceButton.transform.SetParent(transform, false);

            var choiceText = choiceButton.GetComponentInChildren<TextMeshProUGUI>();
            choiceText.text = choice.text;
            choiceButton.onClick.AddListener(delegate { chooseStoryChoice(choice); });
        }
    }
    
    private IEnumerator FadeTo(GameObject objectToFade, float startValue, float aValue, float aTime, float delay = 0f)
    {
        var spriteRenderer = objectToFade.GetComponent<SpriteRenderer>();
        float alpha = startValue;
        var firstColor = new Color(1, 1, 1, alpha);
        spriteRenderer.color = firstColor;
        objectToFade.SetActive(true);
        yield return new WaitForSeconds(delay);
        for (float t = 0.0f; t < 1.0f; t += Time.deltaTime / aTime)
        {
            Color newColor = new Color(1, 1, 1, Mathf.Lerp(alpha,aValue,t));
            spriteRenderer.color = newColor;
            yield return null;
        }
    }
    
    
    private IEnumerator FadeMusic(AudioSource song, float endVolume, float lerpTime)
    {
        var startVolume = song.volume;
        var currentTime = 0.0f;

        if (endVolume == 0f) {
            while (song.volume > 0f) {
                currentTime += Time.deltaTime;
                song.volume = Mathf.Lerp(startVolume, endVolume, currentTime / lerpTime);
                yield return null;
            }
        } else {
            while (currentTime < lerpTime) {
                currentTime += Time.deltaTime;
                song.volume = Mathf.Lerp(startVolume, endVolume, currentTime / lerpTime);
                yield return null;
            }
        }



//        
//        float currentTime = 0.0f; 
//        
//        while (song.volume > 0)
//        {
//            currentTime += Time.deltaTime;
//            song.volume = Mathf.Lerp(1, 0, currentTime / lerpTime);
//            yield return null;
//        }
    }
}
