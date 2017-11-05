String s;
String a;
boolean chg=false;
int totalTime1=5000;
int savedTime;
MadLib prog;
PFont myFont;

void setup() {
  size(1300, 100);
  savedTime = millis();
  prog = new MadLib();
  //myFont=loadFont("AvenirNext-Bold-48.vlw");
  //textFont(myFont, 48);
}
void draw() {
  background(0);
  int passedTime=(millis()-savedTime);
  if (chg==false) {
    pushMatrix();
    //s="Advanced";

    translate(-580, 0);
    fill(255);
    //textSize(50);
    //text(s, width/2, height/2);
    fill(255);
    textSize(30);
    text(prog.getPoem(), width/2, height/2);
    println(prog);
    popMatrix();
  } else {
    pushMatrix();
    //a="Computer Science!";
    translate(-580, 0);
    fill(255);
    textSize(50);
    //text(a, width/2, height/2);
    fill(255);
    textSize(30);
    text(prog.getPoem(), width/2, height/2);
    println(prog);
    popMatrix();
  }
  if (passedTime>totalTime1) {
    println("5 seconds");
    if (chg==false) {
      chg=true;
      prog.madLibsChecker();
    } else if (chg==true) {
      chg=false;
      prog.madLibsChecker();
    }
    savedTime=millis();
    println(savedTime);
  }
}


import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;
import static java.lang.System.*;
import java.net.MalformedURLException;
import java.net.URL;

public class MadLib{
  private ArrayList<String> verbs;
  private ArrayList<String> nouns;
  private ArrayList<String> adjectives;
  private String poem="";
  
  public MadLib(){
    verbs = new ArrayList<String>();
    nouns = new ArrayList<String>();
    adjectives = new ArrayList<String>();
    
     loadNouns();
    loadVerbs();
    loadAdjectives();
  }


  
  public void madLibsChecker(){
    poem="";
    try{
      Scanner file = new Scanner(new File("Desktop/ACSMadlibs/data/story.dat"));
      while(file.hasNext())
      {
        String symbol = file.next();
        if(symbol.equals("#")){
          poem+=getRandomNoun() + " ";
        }
        else if(symbol.equals("@")){
          poem+=getRandomVerb() + " ";
        }
        else if(symbol.equals("&")){
          poem+=getRandomAdjective() + " ";
        }
        else
        {
          poem+=symbol+ " ";
        }
      }
     
    
    }
    catch(Exception e)
    {
      out.println("Houston we have a problem!");
    }
     
  }
  
  public String getPoem(){
  
    return poem;
    
  
  }
  //public void loadNouns()
  //{
  //  try{
  //    Scanner file = new Scanner(new File("Desktop/ACSMadlibs/data/nouns.dat"));
  //    while(file.hasNext())
  //    {
  //      nouns.add(file.next());
  //    }
  //  }
  //  catch(Exception e)
  //  {
  //  }  
    
  //}
  
  public void loadNouns() {
    try {
      //Scanner scan = new Scanner(new File("data/verbs.dat"));
      Scanner scan = new Scanner((new URL("https://raw.githubusercontent.com/aaronbassett/Pass-phrase/master/nouns.txt")).openStream());
      while (scan.hasNext()) {
        nouns.add(scan.next());
      }
    } catch (MalformedURLException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  public void loadVerbs() {
    try {
      //Scanner scan = new Scanner(new File("data/verbs.dat"));
      Scanner scan = new Scanner((new URL("https://raw.githubusercontent.com/hathcox/Madlibs/master/verbs.list")).openStream());
      while (scan.hasNext()) {
        verbs.add(scan.next());
      }
    } catch (MalformedURLException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

 public void loadAdjectives() {
    try {
      //Scanner scan = new Scanner(new File("data/adjectives.dat"));
      Scanner scan = new Scanner((new URL("https://raw.githubusercontent.com/aaronbassett/Pass-phrase/master/adjectives.txt")).openStream());
      while (scan.hasNext()) {
        adjectives.add(scan.next());
      }
     } catch (MalformedURLException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public String getRandomVerb()
  {
    int spot = (int)(Math.random()*verbs.size());
    return verbs.get(spot);
  }
  
  public String getRandomNoun()
  {
    int spot = (int)(Math.random()*nouns.size());
    return nouns.get(spot);
  }
  
  public String getRandomAdjective()
  {
    int spot = (int)(Math.random()*adjectives.size());
    return adjectives.get(spot);
  }    

  public String toString()
  {
     return poem+"\n\n\n";
  }
}

