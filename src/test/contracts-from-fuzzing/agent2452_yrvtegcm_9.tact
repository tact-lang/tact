struct A {
    valA: Int;
}

struct B {
    valB: Int;
    a: A;
}

struct C {
    valC: Int;
    b: B;
}

contract MultiNest {
    data: C;

    init() {
        self.data = C{
            valC:1,
            b: B{
                valB: 2,
                a: A {
                    valA: 3
                }
            }
        };
    }
}