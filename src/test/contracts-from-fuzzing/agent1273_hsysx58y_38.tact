contract MaxFields {
  a: Int; b: Int?; c: Bool; d: Bool?; e: String;
  f: String?; g: Slice; h: Slice?; i: Cell; j: Cell?;
  k: Address; l: Address?; m: Int; n: Int?; o: Bool;
  p: Bool?; q: String; r: String?; s: Slice; t: Slice?;
  u: Cell; v: Cell?; w: Address; x: Address?; y: Int;
  z: Int?; aa: Bool; ab: Bool?; ac: String; ad: String?;

  init() {
    self.a=0; self.b=null; self.c=true; self.d=null; self.e="";
    self.f=null; self.g=emptyCell().asSlice(); self.h=null; self.i=emptyCell(); self.j=null;
    self.k=myAddress(); self.l=null; self.m=1; self.n=null; self.o=false;
    self.p=null; self.q="abc"; self.r=null; self.s=emptyCell().asSlice(); self.t=null;
    self.u=emptyCell(); self.v=null; self.w=myAddress(); self.x=null; self.y=777;
    self.z=null; self.aa=true; self.ab=null; self.ac="end"; self.ad=null;
  }
}