contract MixAll {
  n: Int=1;
  b: Bool=true;
  s: String ="abc";
  a: Address;
  c: Cell;
  sl: Slice;

  init() {
    self.a = myAddress();
    self.c = emptyCell();
    self.sl = emptyCell().asSlice();
  }
}