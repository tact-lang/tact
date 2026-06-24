struct A {
    s: String;
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

contract FourDeepStorage {
    data: D;

    init() {
        self.data = D{
            c: C{
                b: B{
                    a: A{
                        s: "deep"
                    }
                }
            }
        };
    }
}
