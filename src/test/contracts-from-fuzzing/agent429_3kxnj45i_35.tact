struct A {
    a: Int = 1;
    b: Int = 2;
}

contract DefaultOverride {
    v: A;
    init() {
        self.v = A{ a: 100, b: 200 };
    }
}
