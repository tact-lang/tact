struct H {
    x: Int;
}

struct G {
    h: H;
}

struct F {
    g: G;
}

struct E {
    f: F;
}

struct D {
    e: E;
}

struct C {
    d: D;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract DeepFlat {
    root: A;

    init() {
        self.root = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: F{
                                g: G{
                                    h: H{ x:77 }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}