struct Defaulted {
  a: Int = 42;
  b: Bool = true;
  c: String = "ok";
}

contract DefaultsStruct {
  data: Defaulted;

  init() {
    self.data = Defaulted{};
  }
}