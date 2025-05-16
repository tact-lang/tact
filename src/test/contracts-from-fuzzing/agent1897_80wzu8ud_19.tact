struct StringOptional {
  a: String?;
  b: String?;
  c: String;
}

contract StringOptContract {
  s: StringOptional;

  init() {
    self.s = StringOptional{
      a: null,
      b: null,
      c: "hello"
    };
  }
}
