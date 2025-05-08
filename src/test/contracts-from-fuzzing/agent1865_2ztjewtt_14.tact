struct Nested {
    inside: Int;
}

contract OptAndReg {
    a: Int;
    b: Int?;
    c: Nested;
    d: Nested?;

    init() {
        self.a = 0;
        self.b = null;
        self.c = Nested{ inside: 1 };
        self.d = null;
    }
}