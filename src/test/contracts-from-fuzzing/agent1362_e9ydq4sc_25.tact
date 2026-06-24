struct A {
    x: Int;
}

struct B {
    a1: A;
    a2: A;
    y: Int;
}

contract Test {
    b: B;

    init() {
        self.b = B{
            a1: A{ x:1 },
            a2: A{ x:2 },
            y:3
        };
    }
    receive() {}
}