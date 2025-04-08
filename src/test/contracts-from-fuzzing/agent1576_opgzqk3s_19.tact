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

struct D {
    c1: C;
    c2: C;
}

contract DeeplyNestedHuge {
    d: D;
    init() {
        self.d = D{
            c1: C{
                b1: B{a1:A{x:1}, a2:A{x:2}},
                b2: B{a1:A{x:3}, a2:A{x:4}}
            },
            c2: C{
                b1: B{a1:A{x:5}, a2:A{x:6}},
                b2: B{a1:A{x:7}, a2:A{x:8}}
            }
        };
    }
}