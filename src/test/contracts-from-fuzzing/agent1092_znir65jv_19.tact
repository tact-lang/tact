struct OptStruct {
  data: Int?;
}

contract OptVsNull {
  a: OptStruct?;

  init() {
    self.a = null;
  }
}
