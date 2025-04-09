struct A {
    a: B;
}
struct B {
    b: C;
}
struct C {
    c: D;
}
struct D {
    d: E;
}
struct E {
    e: F;
}
struct F {
    f: G;
}
struct G {
    g: Int;
}

contract Deep7 {
    data: A;
    init() {
        self.data = A {
            a: B {
                b: C {
                    c: D {
                        d: E {
                            e: F {
                                f: G {
                                    g: 7
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
