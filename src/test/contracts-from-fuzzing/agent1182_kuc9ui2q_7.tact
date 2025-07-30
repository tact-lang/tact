struct Inner {
  foo: Int;
  bar: Bool;
}

struct Outer {
  nestedOpt: Inner?;
  text: String;
}

contract OptionalDeeper {
  data: Outer;

  init() {
    self.data = Outer{ nestedOpt: null, text: "hello" };
  }
}
