struct LiteralsDefault {
  a: Int = 42;
  b: Bool = true;
  c: String = "x";
}

contract DefaultStructInStorage {
  val: LiteralsDefault;

  init() {
    self.val = LiteralsDefault{};
  }
}