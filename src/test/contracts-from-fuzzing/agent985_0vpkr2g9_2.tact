struct DeepNested {
  foo: Int;
  bar: String;
  nested: Inner;
}

struct Inner {
  a: Int;
  b: String;
}

contract UseDeepNested {
  dn: DeepNested;

  init() {
    self.dn = DeepNested{
      foo: 1,
      bar: "bar",
      nested: Inner{a:2, b:"bbb"}
    };
  }
}