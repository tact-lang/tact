struct InnerMost {
    x: Int;
}

struct Inner {
    val: InnerMost;
}

contract NestedTest {
    z: Inner;
    init() {
        self.z = Inner{ val: InnerMost{ x: 42 } };
    }
}