struct A {
    fA: Int;
}

struct B {
    fB: Int;
    a: A;
}

struct C {
    fC: Int;
    b: B;
}

contract Chain3 {
    stored: C;

    init() {
        self.stored = C{
            fC: 3,
            b: B{
                fB: 2,
                a: A{
                    fA: 1
                }
            }
        };
    }
}
