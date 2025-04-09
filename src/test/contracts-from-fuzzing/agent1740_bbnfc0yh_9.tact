struct A {
    i: Int;
}

struct B {
    j: Int;
    a: A;
}

struct C {
    k: Int;
    b: B;
}

contract DeepFields {
    c: C = C{
        k: 1,
        b: B{
            j: 2,
            a: A{
                i: 3
            }
        }
    };

    init() {
        self.c = C{
            k: 10,
            b: B{
                j: 20,
                a: A{
                    i: 30
                }
            }
        };
    }
}