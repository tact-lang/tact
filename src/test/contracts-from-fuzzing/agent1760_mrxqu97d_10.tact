struct A {
    f1: Int;
}

struct B {
    f1: A;
}

struct C {
    f1: B;
}

struct D {
    f1: C;
}

struct E {
    f1: D;
}

contract Chain {
    chain: E;

    init() {
        self.chain = E{
            f1: D{
                f1: C{
                    f1: B{
                        f1: A{
                            f1: 77
                        }
                    }
                }
            }
        };
    }
}