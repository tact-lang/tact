contract ManyFields {
  a: Int; b: Bool; c: Int?; d: Bool?; e: String;
  f: Int; g: Bool; h: Int?; i: Bool?; j: String;
  k: Int; l: Bool; m: Int?; n: Bool?; o: String;

  init() {
    self.a=1; self.b=true; self.c=null; self.d=false; self.e="x";
    self.f=2; self.g=false; self.h=100; self.i=null; self.j="y";
    self.k=3; self.l=true; self.m=null; self.n=true; self.o="z";
  }
}