struct A {
    n: Int;
}

struct B {
    s: A;
}

struct C {
    s: B;
}

struct D {
    s: C;
}

struct E {
    s: D;
}

struct F {
    s: E;
}

struct G {
    s: F;
}

contract NestedStruct7Levels {
    data: G;

    init() {
        self.data = G{
            s: F{
                s: E{
                    s: D{
                        s: C{
                            s: B{
                                s: A{
                                    n: 777
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}