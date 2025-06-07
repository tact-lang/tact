struct A {
    a: Int;
}

struct B {
    a: Int;
    b: A;
}

struct C {
    a: B;
}

struct D {
    a: C;
}

contract TestContract {
    data: D;
    init() {
        self.data = D{
            a: C{
                a: B{
                    a: 1,
                    b: A{
                        a: 2
                    }
                }
            }
        };
    }
}