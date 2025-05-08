// test optional primitive fields on contract directly
contract OptionalDirect {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Slice?;
  f: Cell?;

  init() {
    self.a=null; self.b=null; self.c=null; self.d=null; self.e=null; self.f=null;
  }
}
