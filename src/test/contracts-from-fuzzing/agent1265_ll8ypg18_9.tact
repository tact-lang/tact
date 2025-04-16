struct NestedOptional {
  opt1: Int?;
  inner: InnerStruct?
}

struct InnerStruct {
  val: Int;
  flag: Bool?;
}

contract OptNestedField {
  nf: NestedOptional;

  init() {
    self.nf = NestedOptional{
      opt1: null,
      inner: InnerStruct{
        val: 7,
        flag: false,
      },
    };
  }
}