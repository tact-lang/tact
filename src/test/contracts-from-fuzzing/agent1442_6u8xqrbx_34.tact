// very wide / large flat persistent contract state
contract Huge {
  a1:Int;  a2:Int;  a3:Int;  a4:Int;  a5:Int;  a6:Int;  a7:Int;  a8:Int;  a9:Int;  a10:Int;
  b1:Int;  b2:Int;  b3:Int;  b4:Int;  b5:Int;  b6:Int;  b7:Int;  b8:Int;  b9:Int;  b10:Int;
  c1:Bool; c2:Bool; c3:Bool; c4:Bool; c5:Bool; c6:Bool; c7:Bool; c8:Bool; c9:Bool; c10:Bool;

  init() {
    self.a1=0;self.a2=0;self.a3=0;self.a4=0;self.a5=0;self.a6=0;self.a7=0;self.a8=0;self.a9=0;self.a10=0;
    self.b1=0;self.b2=0;self.b3=0;self.b4=0;self.b5=0;self.b6=0;self.b7=0;self.b8=0;self.b9=0;self.b10=0;
    self.c1=false;self.c2=false;self.c3=false;self.c4=false;self.c5=false;self.c6=false;self.c7=false;self.c8=false;self.c9=false;self.c10=false;
  }
}