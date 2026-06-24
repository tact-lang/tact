struct Inner {
    value: Int;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract DeepNested {
    data: Outer;
    init() {
        self.data = Outer{ mid: Mid{ inner: Inner{ value: 123 } } };
    }
}