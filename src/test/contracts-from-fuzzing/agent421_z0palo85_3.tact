struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    val: Int;
}

contract NestedStructFieldTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: Inner{ a: 5 },
            val: 7
        };
    }
}