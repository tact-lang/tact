struct OptStruct {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract NestedOptContract {
  s1: OptStruct?;
  s2: OptStruct?;
  init() {
    self.s1 = null;
    self.s2 = null;
  }
}