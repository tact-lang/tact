struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner?;
}

contract NestedOptionalsStructTest {
    nested: Outer;

    init() {
        self.nested = Outer { inner: null };
    }
}