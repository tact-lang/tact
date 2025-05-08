struct Outer {
    inner: Inner;
}

struct Inner {
    num: Int;
}

contract NestedOrderTest {
    val: Outer;

    init() {
        self.val = Outer{ inner: Inner{ num: 42 } };
    }
}