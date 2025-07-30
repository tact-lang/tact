struct Outer {
    inner: Inner?;
    flag: Bool;
}

struct Inner {
    value: Int;
}

contract NullableNested {
    s: Outer;

    init() {
        self.s = Outer{
            inner: Inner{ value: 10 },
            flag: true
        };
    }
}