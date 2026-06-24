struct A {
    val: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
    a4: A;
}

struct C {
    b1: B;
    b2: B;
}

contract MultiNested {
    data: C;

    init() {
        self.data = C{
            b1: B{
                a1: A{val: 1},
                a2: A{val: 2},
                a3: A{val: 3},
                a4: A{val: 4}
            },
            b2: B{
                a1: A{val: 5},
                a2: A{val: 6},
                a3: A{val: 7},
                a4: A{val: 8}
            }
        };
    }
}