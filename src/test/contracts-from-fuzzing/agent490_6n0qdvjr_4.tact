struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    b: A;
}

struct C {
    b1: B;
    b2: B;
}

contract NestedDeeply {
    field: C;
    init() {
        self.field = C{
            b1: B{
                a: A{x:1, y:2},
                b: A{x:3, y:4}
            },
            b2: B{
                a: A{x:5, y:6},
                b: A{x:7, y:8}
            }
        };
    }
}