struct A {
    v: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract NestedAssign {
    s: C;

    init() {
        self.s = C{
            b: B{
                a: A{
                    v:123
                }
            }
        };
    }
}