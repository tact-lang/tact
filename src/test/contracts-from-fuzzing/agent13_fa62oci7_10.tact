struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: Int;
    b: B;
}

contract MultiNest {
    field: C;

    init() {
        self.field = C{
            z: 30,
            b: B{
                y: 20,
                a: A{
                    x: 10
                }
            }
        };
    }
}