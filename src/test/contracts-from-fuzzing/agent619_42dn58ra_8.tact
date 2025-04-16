struct Defaults {
  a: Int = 13;
  b: Bool = true;
  c: String = "hi";
}

contract DefaultStruct {
  data: Defaults;

  init() {
    self.data = Defaults{};
  }
}
