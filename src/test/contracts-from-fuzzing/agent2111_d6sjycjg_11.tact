// large flat contract with many fields of distinct primitive types and nested optionals
contract WideVariety {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Cell;
  f: Address;
  oa: Int?;
  ob: Bool?;
  oc: String?;
  od: Slice?;
  oe: Cell?;
  of: Address?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "";
    self.d = emptyCell().asSlice();
    self.e = emptyCell();
    self.f = myAddress();
    self.oa = null;
    self.ob = null;
    self.oc = null;
    self.od = null;
    self.oe = null;
    self.of = null;
  }
}