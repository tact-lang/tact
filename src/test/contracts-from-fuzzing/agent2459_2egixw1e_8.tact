struct DeepOpts {
  innerVal: Int?;
  innerStruct: OptStruct?;
}

struct OptStruct {
  foo: Int;
  bar: Bool?;
}

contract TestContract {
  data: DeepOpts;

  init() {
    self.data = DeepOpts{
      innerVal: null,
      innerStruct: OptStruct{foo: 1, bar: null}
    };
  }
}