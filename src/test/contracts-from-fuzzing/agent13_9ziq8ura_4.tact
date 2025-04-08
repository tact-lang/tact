struct A {
    x: Int;
}

struct B {
    a1: A;
    a2: A;
}

struct C {
    b1: B;
    b2: B;
}

contract DeepNest {
    val: C;

    init() {
        self.val = C{
            b1: B{ a1: A{ x: 1 }, a2: A{ x: 2 } },
            b2: B{ a1: A{ x: 3 }, a2: A{ x: 4 } }
        };
    }
}