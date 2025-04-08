struct C {
    c: Int;
}

struct B {
    b: C;
}

struct A {
    a: B;
}

contract DeepChain {
    root: A;

    init() {
        self.root = A {
            a: B {
                b: C {
                    c: 123
                }
            }
        };
    }
}