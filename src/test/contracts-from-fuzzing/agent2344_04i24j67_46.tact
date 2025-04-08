struct Inner {
  a: Int;
  b: Bool?;
}

struct Outer {
  in1: Inner;
  in2: Inner;
}

struct Wrap {
  data: Outer;
}

contract HighlyNested {
  val: Wrap;

  init() {
    self.val = Wrap {
      data: Outer {
        in1: Inner { a:1, b:null },
        in2: Inner { a:2, b:true },
      },
    };
  }
}