struct Inner {
    a: Int;
}

contract ArrayOfStructs {
    x1: Inner;
    x2: Inner;
    x3: Inner;

    init() {
        self.x1 = Inner{ a:1 };
        self.x2 = Inner{ a:2 };
        self.x3 = Inner{ a:3 };
    }
}