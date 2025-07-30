// Contract with very long list (20+) of mixed persistent fields
contract TestContract {
 a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?;
 g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?;
 m: Int; n: Bool; o: String; p: Int?; q: Bool?; r: String?;
 s: Int; t: Bool;

 init() {
  self.a=1; self.b=true; self.c="c"; self.d=null; self.e=false; self.f=null;
  self.g=2; self.h=true; self.i="i"; self.j=3; self.k=true; self.l="l";
  self.m=4; self.n=false; self.o="o"; self.p=5; self.q=null; self.r="r";
  self.s=6; self.t=false;
 }
}