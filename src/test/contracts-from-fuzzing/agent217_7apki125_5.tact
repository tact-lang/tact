struct A {
    f1: Int;
}

struct B {
    f2: A;
}

struct C {
    f3: B;
}

struct D {
    f4: C;
}

contract DeepChain {
    data: D;

    init() {
        self.data = D {
            f4: C {
                f3: B {
                    f2: A {
                        f1: 7
                    }
                }
            }
        };
    }
}
