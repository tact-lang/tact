struct Inner {
    val: Int;
}

contract StructArrayVariant {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
    e: Inner;

    init() {
        self.a = Inner{ val: 1 };
        self.b = Inner{ val: 2 };
        self.c = Inner{ val: 3 };
        self.d = Inner{ val: 4 };
        self.e = Inner{ val: 5 };
    }
}