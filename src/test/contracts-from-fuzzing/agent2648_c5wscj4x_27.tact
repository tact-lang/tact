contract VeryWide {
  a0:Int; a1:Int; a2:Int; a3:Int; a4:Int;
  a5:Int?; a6:Int?; a7:Int?; a8:Int?; a9:Int?;
  b0:Bool; b1:Bool; b2:Bool; b3:Bool; b4:Bool;
  c0:String; c1:String; c2:String; c3:String; c4:String;
  d0:String?; d1:String?; d2:String?; d3:String?; d4:String?;
  e0:Int; e1:Int?; e2:Bool; e3:String; e4:String?;

  init() {
    self.a0=0; self.a1=1; self.a2=2; self.a3=3; self.a4=4;
    self.a5=null; self.a6=6; self.a7=null; self.a8=8; self.a9=null;
    self.b0=true; self.b1=false; self.b2=true; self.b3=false; self.b4=true;
    self.c0="a"; self.c1="b"; self.c2="c"; self.c3="d"; self.c4="e";
    self.d0=null; self.d1="x"; self.d2=null; self.d3="y"; self.d4=null;
    self.e0=42; self.e1=null; self.e2=false; self.e3="hello"; self.e4="bye";
  }
}