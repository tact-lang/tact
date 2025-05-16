struct Inner {
    val: Int;
}

contract ArrayOfStructs {
    s1: Inner;
    s2: Inner;
    s3: Inner;
    s4: Inner;
    s5: Inner;

    init() {
        self.s1 = Inner{ val: 1 };
        self.s2 = Inner{ val: 2 };
        self.s3 = Inner{ val: 3 };
        self.s4 = Inner{ val: 4 };
        self.s5 = Inner{ val: 5 };
    }
}