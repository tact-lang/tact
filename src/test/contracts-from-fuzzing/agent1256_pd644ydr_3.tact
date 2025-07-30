struct Inner {
  foo: Int;
  bar: String;
}

struct Middle {
  inner: Inner;
  optional: Bool?;
}

struct Outer {
  mid: Middle;
  description: String;
}

contract DeepNestedStruct {
  data: Outer;

  init() {
    self.data = Outer {
        mid: Middle {
            inner: Inner { foo: 42, bar: "test" },
            optional: true
        },
        description: "desc"
    };
  }
}
