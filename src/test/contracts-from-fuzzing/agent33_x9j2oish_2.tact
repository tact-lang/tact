struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    maybeInner: Inner?;
    bigInt: Int;
}

contract WideNestedStruct {
    state: Outer;

    init() {
        self.state = Outer{
            inner1: Inner{ flag: true, count: 1 },
            inner2: Inner{ flag: false, count: 2 },
            maybeInner: null,
            bigInt: 42,
        };
    }
}