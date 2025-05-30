struct Sub {
  a: Int;
  b: String;
  c: Bool;
}

contract DeepDefault {
  subfield: Sub;

  init() {
    self.subfield = Sub{
      a: 123,
      b: "test",
      c: true
    };
  }
}