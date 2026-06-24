struct Inner {
    value: Int;
}

struct Outer {
    data: Inner;
}

contract InitDefaultMix {
    outer: Outer = Outer{ data: Inner{ value: 0 } };
    counter: Int;

    init() {
        self.counter = 10;
        self.outer = Outer{ data: Inner{ value: 42 } };
    }
}
