struct D {
    val: Int;
}

struct C {
    d: D;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract DeepChain {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{ val: 1 }
                }
            }
        };
    }
}
