struct Inner {
  i: Int;
  s: String;
  optBool: Bool?;
}

struct Outer {
  intVal: Int;
  nested: Inner;
  optInner: Inner?;
}

contract Test {
  val: Outer = Outer{
    intVal: 10,
    nested: Inner{
      i: 1,
      s: "abc",
      optBool: null,
    },
    optInner: null,
  };

  init() {
    self.val = Outer{
      intVal: 20,
      nested: Inner{
        i: 2,
        s: "def",
        optBool: false,
      },
      optInner: Inner{
        i: 3,
        s: "ghi",
        optBool: true,
      },
    };
  }
}