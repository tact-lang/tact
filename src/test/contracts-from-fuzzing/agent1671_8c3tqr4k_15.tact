struct A {
    a1: Int;
}

struct B {
    b1: Int;
    nestedA: A;
}

struct C {
    c1: Int;
    nestedB: B;
}

struct D {
    d1: Int;
    nestedC: C;
}

struct E {
    e1: Int;
    nestedD: D;
}

struct F {
    f1: Int;
    nestedE: E;
}

contract Test {
    deeply: F;

    init() {
        self.deeply = F{
            f1:1,
            nestedE: E{
                e1:2,
                nestedD: D{
                    d1:3,
                    nestedC: C{
                        c1:4,
                        nestedB: B{
                            b1:5,
                            nestedA: A{
                                a1:6
                            }
                        }
                    }
                }
            }
        };
    }
}