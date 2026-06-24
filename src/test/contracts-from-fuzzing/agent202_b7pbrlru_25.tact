struct Params {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = true;
    e: Bool = false;
}

contract ComplexDefaults {
    p: Params;
    init() {
        self.p = Params{};
    }

    receive() {
        let _ = self.p.a + self.p.b + self.p.c;
    }
}