struct Inner {
    a: Int;
}

contract Top {
    a: Inner;
    b: Int;
    c: Inner;

    init() {
        self.a = Inner { a: 1 };
        self.b = 2;
        self.c = Inner { a: 3 };
    }
}
