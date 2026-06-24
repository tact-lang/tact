struct A {
    a1: Int;
    a2: Int?;
}

struct B {
    b1: A;
    b2: Int?;

}

struct C {
    c1: B;
    c2: A;
    c3: B;
}

contract CrossNest {
    val: C;

    init() {
        self.val = C{
            c1: B{ b1: A{a1: 1,a2: null}, b2: null },
            c2: A{ a1: 2, a2: null },
            c3: B{ b1: A{a1: 3,a2: null}, b2: null }
        };
    }
}