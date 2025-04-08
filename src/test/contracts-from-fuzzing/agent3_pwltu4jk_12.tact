struct A {
    x: Int;
    y: B;
}

struct B {
    m: Int;
    n: C;
}

struct C {
    u: Int?;
}

contract NestedDepth {
    s: A;

    init() {
        self.s = A{
            x: 21,
            y: B{
                m:31,
                n: C{
                    u: null
                }
            }
        };
    }
}