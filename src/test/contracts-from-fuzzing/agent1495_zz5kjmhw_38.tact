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
    e: Int;
}

contract ABCDTest {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        e: 123
                    }
                }
            }
        };
    }
}
