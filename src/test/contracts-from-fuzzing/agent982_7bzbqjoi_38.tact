struct Inner {
  x: Int;
  y: Bool;
}

struct Outer {
    nest: Inner;
    val: Int?;
}

contract NullOuterTest {
    data: Outer?;

    init() {
        self.data = null;
    }
}