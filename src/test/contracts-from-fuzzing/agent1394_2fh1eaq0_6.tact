struct A {
    n: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract VeryDeepNested {
    deep: D;

    init() {
        self.deep = D{ c: C{ b: B{ a: A{ n: 42 } } } };
    }
}