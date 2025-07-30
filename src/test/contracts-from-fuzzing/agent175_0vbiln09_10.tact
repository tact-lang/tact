contract Wide {
  a: Int; b: Bool; c: Cell; d: Slice; e: Address; f: String;
  g: Int?; h: Bool?; i: Cell?; j: Slice?; k: Address?; l: String?;

  init() {
    self.a=1; self.b=true; self.c=emptyCell(); self.d=emptyCell().asSlice();
    self.e=myAddress(); self.f="abc";
    self.g=null; self.h=null; self.i=null; self.j=null; self.k=null; self.l=null;
  }
}