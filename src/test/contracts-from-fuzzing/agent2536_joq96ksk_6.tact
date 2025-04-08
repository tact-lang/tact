struct Defaults2 {
  a: Int = 1;
  b: Bool = false;
  c: String = "hello";
  d: Int? = null;
  e: String? = null;
  f: Int = 5 + 10;
}

contract WithDefaults2 {
  x: Defaults2;

  init() {
    self.x = Defaults2{};
  }
}