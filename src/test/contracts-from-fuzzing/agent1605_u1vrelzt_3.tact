struct NestedB {
    c: Int;
    d: Bool;
}

struct NestedA {
    a: Int;
    b: NestedB;
}

contract TestContract {
    complex: NestedA;

    init() {
        self.complex = NestedA{ a: 1, b: NestedB{ c: 2, d: true } };
    }

    receive() {
        self.complex = NestedA{ a: 3, b: NestedB{ c: 4, d: false } };
    }
}