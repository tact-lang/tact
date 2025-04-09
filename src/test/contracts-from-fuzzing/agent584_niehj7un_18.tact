struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    g1: String;
    g2: Int;
}

contract TupleStyle {
    a: A;
    b: B;

    init() {
        self.a = A{ f1: 1, f2: true };
        self.b = B{ g1: "hi", g2: 5 };
    }
}