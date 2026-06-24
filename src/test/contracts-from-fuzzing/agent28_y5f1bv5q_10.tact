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
    value: Int;
}

contract Test {
    nested: A;

    init() {
        self.nested = A{
            b: B{
                c: C{
                    d: D{value: 99}
                }
            }
        };
    }
}