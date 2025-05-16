contract DeepAndWide {
  a:Int; b:Int; c:Int; d:Int; e:Int;
  f:Int?; g:Int?; h:Int?; i:Int?; j:Int?;
  k:Bool; l:Bool; m:Bool?; n:Bool?;
  o:String; p:String?;

  init() {
    self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
    self.f=null; self.g=7; self.h=null; self.i=9; self.j=null;
    self.k=true; self.l=false; self.m=true; self.n=null;
    self.o="str"; self.p=null;
  }
}