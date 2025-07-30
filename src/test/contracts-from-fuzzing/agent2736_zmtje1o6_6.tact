struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    x: Int;
}

contract DeepChain {
    field: A;

    init() {
        self.field = A{
            b: B{
                c: C{
                    d: D{ x: 99 }
                }
            }
        };
    }
}