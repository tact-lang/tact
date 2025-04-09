struct A {
    i: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract TestContract {
    nested: D;

    init() {
        self.nested = D{
            c: C{
                b: B{
                    a: A{
                        i: 123
                    }
                }
            }
        };
    }
}