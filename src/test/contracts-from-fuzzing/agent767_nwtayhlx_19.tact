contract BigVars {
    a:Int; b:Int; c:Int; d:Int; e:Int;
    f:Int as uint8; g:Int as int16; h:Int as coins;
    i:Bool; j:Bool; k:Bool; l:Bool; m:Bool;
    n:String; o:String; p:String; q:String; r:String;
    s:Slice; t:Slice; u:Slice; v:Slice; w:Slice;
    x:Address?; y:Address?; z:Address?; aa:Address?; ab:Address?;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=6; self.g=7; self.h=8;
        self.i=true; self.j=false; self.k=true; self.l=false; self.m=true;
        self.n="n"; self.o="o"; self.p="p"; self.q="q"; self.r="r";
        self.s=emptyCell().asSlice(); self.t=emptyCell().asSlice(); self.u=emptyCell().asSlice(); self.v=emptyCell().asSlice(); self.w=emptyCell().asSlice();
        self.x=null; self.y=null; self.z=null; self.aa=null; self.ab=null;
    }
}
