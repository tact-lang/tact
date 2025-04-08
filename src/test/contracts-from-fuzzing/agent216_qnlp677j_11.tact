struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

struct D {
    w: C;
}

struct E {
    v: D;
}

struct F {
    u: E;
}

contract Deepest {
    f: F;

    init() {
        self.f = F{
            u: E{
                v: D{
                    w: C{
                        z: B{
                            y: A{ x: 42 }
                        }
                    }
                }
            }
        };
    }
}