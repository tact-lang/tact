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
    e: Int;
}

contract ChainNest {
    deep: A;

    init() {
        self.deep = A{
            b: B{
                c: C{
                    d: D{
                        e: 42,
                    }
                }
            }
        };
    }
}