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
    val: Int;
}

contract Deep8 {
    f0: A;

    init() {
        self.f0 = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: F{
                                g: G{
                                    h: H{
                                        val: 999
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