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

contract Test {
    c: C;

    init() {
        self.c = C{
            z: 123,
            b: B{
                y: 456,
                a: A{
                    x: 789,
                },
            },
        };
    }
}