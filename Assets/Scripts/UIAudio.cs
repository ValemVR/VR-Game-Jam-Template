using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class UIAudio : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler
{
    public string clickAudioName;
    public string hoverEnterAudioName;
    public string hoverExitAudioName;

    public void OnPointerClick(PointerEventData eventData)
    {
        if(clickAudioName != "")
        {
            AudioManager.instance.Play(clickAudioName);
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        if (hoverEnterAudioName != "")
        {
            AudioManager.instance.Play(hoverEnterAudioName);
        }
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        if (hoverExitAudioName != "")
        {
            AudioManager.instance.Play(hoverExitAudioName);
        }
    }
}
