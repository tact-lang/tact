struct Composed {
  val: Int;
}

contract DefaultsAndNested {
  a: Int = 5;
  b: String = "hi";
  c: Bool = false;
  d: Composed;

  init() {
    self.d = Composed{val:7};
  }
}