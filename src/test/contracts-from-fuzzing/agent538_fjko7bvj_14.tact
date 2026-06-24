contract MixTypes {
  a: Int = -1;
  b: Bool = true;
  c: Address;
  d: Cell;
  e: Slice;
  f: String = "hi";

  init() {
    self.a = -256;
    self.b = false;
    self.c = myAddress();
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = "hi";
  }
}
