struct StructAB {
    a: Int;
    b: Bool;
}

contract ArrayLike {
    f0: StructAB;
    f1: StructAB;
    f2: StructAB;
    f3: StructAB;
    f4: StructAB;

    init() {
        let base = StructAB{ a: 1, b: true };
        self.f0 = base;
        self.f1 = base;
        self.f2 = base;
        self.f3 = base;
        self.f4 = base;
    }

    receive(){}
}