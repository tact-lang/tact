struct InnerA {
    x: Int;
}

struct InnerB {
    flag: Bool;
}

contract MultiStructFields {
    a: InnerA;
    b: InnerB;

    init() {
        self.a = InnerA{ x: 11 };
        self.b = InnerB{ flag: false };
    }
}
