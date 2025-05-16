contract DefaultsContract {
  a: Int = 1;
  b: Bool = false;
  c: String = "abc";
  d: Int?; // null default
  e: String?; // null default

  init() {
    self.b = true;
    self.d = 5;
    self.e = "x";
  }
}
