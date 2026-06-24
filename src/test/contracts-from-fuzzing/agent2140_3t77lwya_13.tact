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

contract Complex {
    val: C;
    init() {
        self.val = C{
            b: B{
                a: A{ x: 1 },
                y: 2
            },
            z: 3
        };
    }
}
