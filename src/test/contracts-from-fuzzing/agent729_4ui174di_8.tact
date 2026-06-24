contract VariousTypes {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: String?;
  f: Int as uint8;
  g: Int as int128;
  h: Cell;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "ok";
    self.d = null;
    self.e = null;
    self.f = 7;
    self.g = -100;
    self.h = emptyCell();
  }
}
