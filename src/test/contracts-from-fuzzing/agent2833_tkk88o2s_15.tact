struct OptionalRec {
  foo: Int?;
  rec: SubRec?;
}

struct SubRec {
  bar: Int;
}

contract OptStructs {
  data: OptionalRec;

  init() {
    self.data = OptionalRec{
      foo: null,
      rec: null
    };
  }
}