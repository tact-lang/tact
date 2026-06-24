struct StructA {
    ai: Int;
}

struct StructB {
    bi: Int;
}

contract TestContract {
    a: StructA;
    b: StructB;

    init() {
        self.a = StructA{ ai: 1 };
        self.b = StructB{ bi: 2 };
    }
}