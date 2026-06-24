struct DefStruct {
  a: Int = 123;
  b: Bool = true;
  c: String = "hi!";
}

contract RelyOnDefaults {
  s: DefStruct;

  init() {
    self.s = DefStruct{};
  }
}