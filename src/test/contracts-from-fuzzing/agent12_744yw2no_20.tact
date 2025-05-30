struct OptStruct {
  foo: Int;
}

contract OptNullStruct {
  data: OptStruct?;
  init() {
    self.data = null;
  }
}
