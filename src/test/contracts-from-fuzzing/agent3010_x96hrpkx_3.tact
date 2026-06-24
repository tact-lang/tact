struct OptStruct {
  foo: Int?;
  bar: Bool?;
  st: NestedOpt?;
}

struct NestedOpt {
  baz: Int?;
}

contract OptComplex {
  val: OptStruct;

  init() {
    self.val = OptStruct{
      foo: null,
      bar: true,
      st: NestedOpt{ baz: 999 }
    };
  }
}
