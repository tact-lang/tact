struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract NestedStructDeep {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ value: 42 }, flag: false };
    }
}