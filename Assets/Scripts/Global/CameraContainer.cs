using UnityEngine;
using System.Collections;

public class CameraContainer : MonoBehaviour 
{
    public float MoveSpeed = 6f; // How quickly the camera should move from point A to B.
    
	public GameObject player;
	public CameraControl cameraControl;
    private Vector3 offset;
	public bool isUpdating = true;

	void Start ()
	{
//	    offset = transform.position - player.transform.position;
	}
	
	
	void Update () 
	{
		// Set the position of the camera's transform to be the same as the player's, but offset by the calculated offset distance.
		//transform.position = player.transform.position + offset;
		while (cameraControl.isShaking()) {
			return;
		}
//		var targetPos = (Vector3) player.transform.position + offset;
//		targetPos.z = -10f;


//		transform.position = Vector3.MoveTowards(transform.position, targetPos, MoveSpeed * Time.deltaTime);
	}

	public void ResetOffset()
	{
		offset = new Vector3(0,0,-10);		
	}
	

    
}