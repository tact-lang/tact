struct A {
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

struct D {
    d: C;
}

struct E {
    e: D;
}

struct F {
    f: E;
}

contract Test {
    nested: F;

    init() {
        self.nested = F{
            f: E{
                e: D{
                    d: C{
                        c: B{
                            b: A{
                                a: 999
                            }
                        }
                    }
                }
            }
        };
    }
}