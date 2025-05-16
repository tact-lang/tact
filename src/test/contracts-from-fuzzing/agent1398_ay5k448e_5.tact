struct Inner {
    foo: Int;
}

struct Outer {
    inner1: Inner;
    optInner: Inner?;
    boolField: Bool;
}

contract StructOptionalTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ foo: 1 },
            optInner: null,
            boolField: true,
        };
    }
}