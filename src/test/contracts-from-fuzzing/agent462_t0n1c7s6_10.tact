struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    inner1: Inner;
    y: Bool;
    inner2: Inner;
}

contract MultiNestedStruct {
    s: Outer;

    init() {
        self.s = Outer{
            x: 123,
            inner1: Inner{ a: 1, b: true },
            y: false,
            inner2: Inner{ a: 2, b: false }
        };
    }
}