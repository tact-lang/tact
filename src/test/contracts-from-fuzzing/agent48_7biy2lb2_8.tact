struct Nested {
    x: Int;
}

contract TestContract {
    a: Int;
    b: Int?;
    c: Nested;
    d: Int?;
    e: Nested;
    f: Int;

    init() {
        self.a = 1;
        self.b = null;
        self.c = Nested{ x: 2 };
        self.d = null;
        self.e = Nested{ x: 3 };
        self.f = 4;
    }
}