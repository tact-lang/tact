struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

struct Combo {
    f1: A;
    f2: B;
    f3: C;
}

contract WideNested {
    storage: Combo;

    init() {
        self.storage = Combo{
            f1: A{a: 1},
            f2: B{b: 2},
            f3: C{c: 3}
        };
    }
}