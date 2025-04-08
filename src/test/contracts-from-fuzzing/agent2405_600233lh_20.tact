struct Outer {
  x: Int;
  y: Bool;
  inner: Inner;
}

struct Inner {
  msg: String;
  optZ: Int?;
}

contract CrossNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: 1,
            y: true,
            inner: Inner{ msg: "hi", optZ: null }
        };
    }
}