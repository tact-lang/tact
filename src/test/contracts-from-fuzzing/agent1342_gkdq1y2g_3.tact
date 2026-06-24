struct A {
    v1: Int;
}

struct B {
    a: A;
    v2: Int;
}

struct C {
    b: B;
    v3: Int;
}

struct D {
    c: C;
    v4: Int;
}

contract DeepNestTest {
    data: D;

    init() {
        self.data = D{
            c: C{
                b: B{
                    a: A{ v1: 1 },
                    v2: 2
                },
                v3: 3
            },
            v4: 4
        };
    }
}