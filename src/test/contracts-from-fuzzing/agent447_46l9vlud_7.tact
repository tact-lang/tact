struct Defaulted {
  a: Int = 10;
  b: Bool = true;
  c: String = "x";
  d: Int?; // default null
  e: String?; // default null
}

contract DefaultsInside {
  val: Defaulted;

  init() {
    self.val = Defaulted{};
  }
}