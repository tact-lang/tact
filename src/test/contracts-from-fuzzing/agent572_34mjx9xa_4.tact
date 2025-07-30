struct Inner {
    foo: Int = 1;
}

struct Outer {
    bar: Bool = false;
    inner: Inner;
}

contract NestingTest {
    nestedVal: Outer;

    init() {
        self.nestedVal = Outer{
            bar: true,
            inner: Inner{ foo: 999 }
        };
    }
}