struct A {
    a1: Int;
}
struct B {
    b1: A;
}
struct C {
    c1: B;
}
struct D {
    d1: C;
}

contract WideNestedOptionals {
    optA: A?;
    optB: B?;
    optC: C?;
    optD: D?;

    init() {
        self.optA = null;
        self.optB = null;
        self.optC = null;
        self.optD = null;
    }
}