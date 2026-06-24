struct A {
    val: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
}

struct C {
    b1: B;
    b2: B;
}

contract DeepArray {
    data: C;

    init() {
        self.data = C{
            b1: B{
                a1: A{ val: 1 },
                a2: A{ val: 2 },
                a3: A{ val: 3 }
            },
            b2: B{
                a1: A{ val: 4 },
                a2: A{ val: 5 },
                a3: A{ val: 6 }
            }
        };
    }
}