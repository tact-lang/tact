// Deeply nested mix struct, optional, default
struct D {
    f: Int?;
}

struct C {
    d: D;
    f: Bool = true;
}

struct B {
    c: C;
    txt: String?;
}

struct A {
    b: B;
    count: Int = 7;
}

contract TestContract {
    s: A;
    init() {
        self.s = A{
            b: B{
                c: C{
                    d: D{
                        f: null
                    },
                    f: false
                },
                txt: null
            },
            count: 20
        };
    }
}