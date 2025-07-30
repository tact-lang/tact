struct A {
    a1: Int;
}

struct B {
    b1: Bool;
}

struct C {
    c1: String;
}

contract MultiNestedFields {
    fA: A;
    fB: B;
    fC: C;

    init() {
        self.fA = A{ a1: 1 };
        self.fB = B{ b1: true };
        self.fC = C{ c1: "three" };
    }
}