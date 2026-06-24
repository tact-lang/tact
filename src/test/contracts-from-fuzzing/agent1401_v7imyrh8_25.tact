struct DefOptStruct {
  a: Int? = null;
  b: Bool? = true;
}

contract DefOptTest {
  s: DefOptStruct;

  init() {
    self.s = DefOptStruct{};
  }
}