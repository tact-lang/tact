struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    f: F;
}

struct F {
    g: G;
}

struct G {
    h: H;
}

struct H {
    i: I;
}

struct I {
    j: Int;
}

contract TenDeep {
    nested: A;

    init() {
        self.nested = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: F{
                                g: G{
                                    h: H{
                                        i: I{
                                            j: 42
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}