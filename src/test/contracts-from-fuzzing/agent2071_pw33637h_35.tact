struct Innermost {
    value: Int;
}

struct MiddleA {
    inner: Innermost;
}

struct MiddleB {
    inner: Innermost;
}

contract WideNested {
    a: MiddleA;
    b: MiddleB;

    init() {
        self.a = MiddleA{ inner: Innermost{ value: 7 } };
        self.b = MiddleB{ inner: Innermost{ value: 9 } };
    }
}