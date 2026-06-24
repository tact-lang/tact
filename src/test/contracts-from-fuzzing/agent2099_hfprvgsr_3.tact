struct A {
    x: Int;
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

contract VeryDeepNestedContract {
    s: D;

    init() {
        self.s = D{
            c: C{
                b: B{
                    a: A{
                        x: 7
                    }
                }
            }
        };
    }
}