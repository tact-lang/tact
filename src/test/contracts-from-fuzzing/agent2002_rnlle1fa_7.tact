struct A {
    x: Int;
    b: B;
}

struct B {
    y: Int;
    c: C;
}

struct C {
    z: Int;
}

contract MultiNested {
    state: A;

    init() {
        self.state = A{
            x: 1,
            b: B{
                y: 2,
                c: C{
                    z: 3
                }
            }
        };
    }
}
