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
    h: Int;
}

contract Test6 {
    deep: A;
    init() {
        self.deep = A {
            b: B {
                c: C {
                    d: D {
                        e: E {
                            f: F {
                                g: G {
                                    h: 99,
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}