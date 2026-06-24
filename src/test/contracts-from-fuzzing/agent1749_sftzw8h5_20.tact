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
    a: C;
}

contract DeepChain {
    val: D;

    init() {
        self.val = D{
            a: C{
                z: B{
                    y: A{
                        x: 42,
                    }
                }
            }
        };
    }
}