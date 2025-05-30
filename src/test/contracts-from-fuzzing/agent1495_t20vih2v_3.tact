struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  inner1: Inner;
  inner2: Inner;
}

contract DeepNest {
    content: Outer;

    init() {
        self.content = Outer{
            inner1: Inner{ a: 1, b: false },
            inner2: Inner{ a: 2, b: true }
        };
    }
}