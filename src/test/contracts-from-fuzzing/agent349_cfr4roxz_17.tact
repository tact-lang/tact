// Mix default values and non-defaults in contract persistent state
contract MixDefaults {
  a: Int = 11;
  b: Bool; // no default, must init
  c: String = "world";
  d: Address;
  e: Cell;
  f: Slice;

  init() {
    self.b = false;
    self.d = myAddress();
    self.e = emptyCell();
    self.f = emptyCell().asSlice();
  }
}