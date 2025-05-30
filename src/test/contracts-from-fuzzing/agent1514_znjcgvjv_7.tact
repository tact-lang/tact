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
    t: C;
}

struct E {
    u: D;
}

contract DeepFiveLevels {
    root: E;

    init() {
        self.root = E{
            u: D{
                t: C{
                    z: B{
                        y: A{
                            x: 77
                        }
                    }
                }
            }
        };
    }
}