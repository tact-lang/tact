struct S {
  foo: Int? as uint64;
  bar: Bool;
  baz: String?;
}

contract OptionalSerializedStructField {
  s: S;

  init() {
    self.s = S{ foo:null, bar:true, baz:"bingo" };
  }
}