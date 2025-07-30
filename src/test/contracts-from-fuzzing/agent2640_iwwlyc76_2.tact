struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D?;
}

struct D {
    e: E?;
}

struct E {
    f: Int?;
    g: Bool;
}

contract TestContract {
    nested: A;

    init() {
        self.nested = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: 100,
                            g: true
                        }
                    }
                }
            }
        };
    }
}
