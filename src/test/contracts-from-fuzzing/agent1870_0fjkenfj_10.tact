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
    value: Int;
}

contract DeepChain {
    data: B;

    init() {
        self.data = B {
            c: C {
                d: D {
                    e: E {
                        value: 42
                    }
                }
            }
        };
    }
}
