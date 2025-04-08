struct ComplexNested {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  optInt: Int?;
  optStr: String?;
  inner: InnerComplex;
}

struct InnerComplex {
  flag: Bool;
  deepOpt: Int?;
}

contract ComplexStorage {
  data: ComplexNested;

  init() {
    self.data = ComplexNested{
      intVal: 1,
      boolVal: false,
      stringVal: "str",
      optInt: 10,
      optStr: null,
      inner: InnerComplex{flag: true, deepOpt: null}
    };
  }
}