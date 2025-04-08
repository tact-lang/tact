struct NestedOptWithVal {
  foo: Int;
  bar: Bool?;
  baz: String;
}

contract OptStruct2 {
  data: NestedOptWithVal?;
  init() {
     self.data = NestedOptWithVal{
       foo: 1,
       bar: null,
       baz: "hi"
    };
  }
}
