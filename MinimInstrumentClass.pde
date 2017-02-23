import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

//Store an array list with the tones of a C Major scale
String[] cMajorTones = {"C3", "E3", "G3", "C4", "E4", "G4", "C5", "E5", "G5", "C6", "E6"}; 

int currNote = 0;

void setup(){
   // Initialize minim and the audio output channel
   minim = new Minim(this);
   out = minim.getLineOut();
}

void draw(){
  /*
  the playNote function plays a tone through your audio output channel
  its signature is:
  void playNote(float startTime, float duration, float hz)
  where startTime is when the note should begin playing (in beats)
        duration is how long the note should be played for (in beats)
        hz is the frequency, in Hertz, of the note to be played
   See: http://code.compartmental.net/minim/audiooutput_method_playnote.html for more details
   */
  out.playNote(0, 2, new SineInstrument ( Frequency.ofPitch( cMajorTones[currNote] ).asHz()) );
  delay(200);
  
  if (currNote < cMajorTones.length - 1){
    currNote ++;
  }
  else{
   currNote = 0; 
  }
}