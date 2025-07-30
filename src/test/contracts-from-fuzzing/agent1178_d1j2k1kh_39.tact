// very wide contract persistent state, variety of types and optionals
contract Wide {
  a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice;
  g: Int?; h: Bool?; i: String?; j: Address; k: Address?;
  l: Cell?; m: Slice?; n: Int; o: Bool; p: String;

  init() {
    self.a=1; self.b=true; self.c="s"; self.d=myAddress(); self.e=emptyCell(); self.f=self.e.asSlice();
    self.g=null; self.h=false; self.i=null; self.j=myAddress(); self.k=null; self.l=null; self.m=null; self.n=10; self.o=false; self.p="x";
  }
}