struct A {
    x: Int;
    b: B;
}

struct B {
    y: Int;
    c: C;
}

struct C {
    z: Int;
    d: D;
}

struct D {
    w: Int;
}

contract ChainNested {
    state: A;

    init() {
        self.state = A{
            x: 1,
            b: B{
                y: 2,
                c: C{
                    z: 3,
                    d: D{
                        w: 4
                    }
                }
            }
        };
    }
}