struct Base {
    a: Int;
}

struct Derived {
    base: Base;
    b: Int;
}

contract Test14 {
    der: Derived;

    init() {
        self.der = Derived{ base: Base{a: 12}, b: 34 };
    }
}
