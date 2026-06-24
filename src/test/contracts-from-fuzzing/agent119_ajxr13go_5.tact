struct DefaultStruct {
  a: Int = 7;
  b: Bool = true;
  c: String = "default";
}

contract Defaults {
  ds: DefaultStruct;

  init() {
    self.ds = DefaultStruct{};
  }
}