struct NestedInner {
  x: Int = 1;
  y: Bool = true;
}

struct NestedOuter {
  a: Int = 0;
  b: NestedInner;
}

contract NestedStructState {
    val: NestedOuter;

    init() {
        self.val = NestedOuter{ a: 42, b: NestedInner{ x: 10, y: false } };
    }
}
