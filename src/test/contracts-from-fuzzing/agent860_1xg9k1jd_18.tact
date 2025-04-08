contract LongFields {
  a:Int; b:Int?; c:Int; d:Int?; e:Int; f:Int?; g:Int; h:Int?; i:Int; j:Int?;
  k:Int; l:Int?; m:Int; n:Int?; o:Int; p:Int?; q:Int; r:Int?; s:Int; t:Int?;
  u:Int; v:Int?; w:Int; x:Int?; y:Int; z:Int?;
  aa:Bool; ab:Bool?; ac:Address; ad:Address?;
  ae:Cell; af:Cell?; ag:Slice; ah:Slice?; ai:String; aj:String?;

  init() {
    self.a=1; self.b=null; self.c=2; self.d=null;
    self.e=3; self.f=null; self.g=4; self.h=null;
    self.i=5; self.j=null; self.k=6; self.l=null;
    self.m=7; self.n=null; self.o=8; self.p=null;
    self.q=9; self.r=null; self.s=10; self.t=null;
    self.u=11; self.v=null; self.w=12; self.x=null;
    self.y=13; self.z=null; self.aa=true; self.ab=null;
    self.ac=myAddress(); self.ad=null; self.ae=emptyCell(); self.af=null;
    self.ag=emptyCell().asSlice(); self.ah=null; self.ai="hi"; self.aj=null;
  }
}