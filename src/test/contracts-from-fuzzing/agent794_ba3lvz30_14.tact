contract WidePrimitives {
  i: Int;
  j: Int?;
  f: Bool;
  g: Bool?;
  s: String;
  t: String?;
  a: Address;
  b: Address?;
  c: Cell;
  d: Cell?;
  sl: Slice;
  slOpt: Slice?;
  bu: Builder;
  buOpt: Builder?;

  init() {
    self.i = 1;
    self.j = null;
    self.f = false;
    self.g = true;
    self.s = "hi";
    self.t = null;
    self.a = myAddress();
    self.b = null;
    self.c = emptyCell();
    self.d = null;
    self.sl = emptyCell().asSlice();
    self.slOpt = null;
    self.bu = beginCell();
    self.buOpt = null;
  }
}
