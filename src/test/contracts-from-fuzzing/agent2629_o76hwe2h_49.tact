struct S2 {
    a: Int;
    b: Int = 42;
}

contract BothSet {
    f: S2;

    init() {
        self.f = S2{ a:123, b:456 };
    }
}