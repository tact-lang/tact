contract ReprTest {
  a: Int;
  b: Int as uint8;
  c: Int as int64;
  d: Int; 
  e: Int?;

  init() {
    self.a=0; self.b=255; self.c=42; self.d=-1; self.e=null;
  }
}