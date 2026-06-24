contract ManyOptionalPrimitives {
 i1: Int?; i2: Int?; i3: Int?;
 b1: Bool?; b2: Bool?; b3: Bool?;
 s1: String?; s2: String?; s3: String?;
 a1: Address?; a2: Address?; a3: Address?;
 c1: Cell?; c2: Cell?; c3: Cell?;
 sl1: Slice?; sl2: Slice?; sl3: Slice?;
 init() {
  self.i1=null; self.i2=1; self.i3=null;
  self.b1=true; self.b2=null; self.b3=false;
  self.s1=null; self.s2="hi"; self.s3=null;
  self.a1=null; self.a2=myAddress(); self.a3=null;
  self.c1=emptyCell(); self.c2=null; self.c3=emptyCell();
  self.sl1=null; self.sl2=emptyCell().asSlice(); self.sl3=null;
 }
}
