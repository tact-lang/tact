struct OptStruct {
  foo: Int;
  bar: Bool;
}

contract TestContract {
  data: OptStruct?;

  init() {
    self.data = OptStruct{foo: 10, bar: true};
  }
}
