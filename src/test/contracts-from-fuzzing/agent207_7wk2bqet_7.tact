struct A {
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

struct D {
    d: C;
}

contract CircularRef {
    x: D;
    init() {
        self.x = D{
            d: C{
                c: B{
                    b: A{
                        a: 10
                    }
                }
            }
        };
    }
}