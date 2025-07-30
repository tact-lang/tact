struct Inner {
  x: Int;
  y: Bool;
}

struct Outer {
  inner: Inner;
  z: String;
}

contract NestedStructsTest {
    s: Outer;

    init() {
        self.s = Outer{
            inner: Inner{ x: 10, y: false },
            z: "ok"
        };
    }
}