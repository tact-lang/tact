contract LargeOptionMix {
  a: Int?; b: Int?; c: Bool?; d: Bool?; e: String?; f: String?; g: Cell?; h: Address?; i: Cell; j: Address;

  init() {
    self.a = null;
    self.b = 1;
    self.c = null;
    self.d = true;
    self.e = null;
    self.f = "abc";
    self.g = null;
    self.h = myAddress();
    self.i = emptyCell();
    self.j = myAddress();
  }
}