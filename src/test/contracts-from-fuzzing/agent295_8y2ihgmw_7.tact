struct A {
    x: Int;
    y: B;
}

struct B {
    z: Int;
    w: C;
}

struct C {
    q: Int;
}

contract MultiLevelNested {
    state: A;

    init() {
        self.state = A{
            x: 10,
            y: B{
                z: 20,
                w: C{
                    q: 30
                }
            }
        };
    }
}