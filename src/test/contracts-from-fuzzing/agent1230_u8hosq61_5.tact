contract MixedDefaults {
  x: Int = 1;
  y: Bool = true;
  s: String = "hello";
  a: Address;
  c: Cell;

  init() {
    self.a = myAddress();
    self.c = emptyCell();
  }
}