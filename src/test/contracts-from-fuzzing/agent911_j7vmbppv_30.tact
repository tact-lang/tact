struct A {
    f1: Int;
    f2: Int?;
}

struct B {
    g1: A?;
    g2: Bool;
}

struct C {
    h1: B;
}

contract NestedOptionals {
    payload: C;

    init() {
        self.payload = C{
            h1: B{
                g1: null,
                g2: true
            }
        };
    }
}