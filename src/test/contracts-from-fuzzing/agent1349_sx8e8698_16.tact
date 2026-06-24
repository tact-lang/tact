struct Inner {
    value: Int;
}

contract ArrayOfStructs {
    s0: Inner;
    s1: Inner;
    s2: Inner;

    init() {
        self.s0 = Inner{ value: 1 };
        self.s1 = Inner{ value: 2 };
        self.s2 = Inner{ value: 3 };
    }
}