struct S {
  a: Int;
  b: String;
  c: Bool;
}

contract InitStructField {
  sfield: S;
  init() {
    self.sfield = S{
      a: 42,
      b: "hello",
      c: true,
    };
  }
}