struct A {
    f: Int;
}

struct B {
    g: A;
}

struct C {
    h: B;
}

struct D {
    i: C;
}

struct E {
    j: D;
}

contract FiveDeep {
    data: E;

    init() {
        self.data = E{
            j: D{
                i: C{
                    h: B{
                        g: A{
                            f: 123
                        }
                    }
                }
            }
        };
    }
}