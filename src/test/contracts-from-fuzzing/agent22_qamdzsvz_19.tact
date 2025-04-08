struct Defaulted {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
}

contract UseDefaultedStruct {
  data: Defaulted;

  init() {
    self.data = Defaulted{};
  }
}