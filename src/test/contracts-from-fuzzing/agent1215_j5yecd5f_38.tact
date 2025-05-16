struct Defaulted {
  foo: Int = 5;
  bar: Bool = false;
  baz: String = "hi";
}

contract DefStructInit {
  myfield: Defaulted;
  init() {
    self.myfield = Defaulted{};
  }
}