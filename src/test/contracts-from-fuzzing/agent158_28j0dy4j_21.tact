struct A {
    x: Int;
}

struct B {
    a: A;
    y: Int;
}

struct C {
    b: B;
    z: Int;
}

contract OverrideInit {
    data: C;
    init() {
        self.data = C{
            b: B{
                a: A{ x: 5 },
                y: 10
            },
            z: 15
        };
    }
}