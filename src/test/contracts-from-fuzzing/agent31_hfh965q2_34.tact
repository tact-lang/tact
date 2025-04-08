struct OptStruct {
  inner: Int?;
  label: String;
}

contract Test {
  v1: OptStruct?;
  v2: OptStruct?;

  init() {
    self.v1 = null;
    self.v2 = null;
  }
}