struct A {
    x: Int;
    y: B;
}

struct B {
    z: C;
}

struct C {
    q: Int;
}

contract MultiNested {
    field: A;

    init() {
        self.field = A{
            x: 1,
            y: B{
                z: C{
                    q: 99,
                },
            },
        };
    }
}
