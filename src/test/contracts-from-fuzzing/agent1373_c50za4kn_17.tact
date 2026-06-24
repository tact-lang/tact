struct C {
    z: Int?;
}

struct B {
    y: Int;
    optNestedC: C?;
}

struct A {
    x: Int?;
    nestedB: B;
}

contract Test {
    root: A;

    init() {
        self.root = A{
            x: null,
            nestedB: B{
                y: 11,
                optNestedC: C{
                    z: 77
                }
            }
        };
    }
}