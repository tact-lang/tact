struct B {
    sub: A;
    z: Int;
}

struct A {
    x: Int;
    y: Int;
}

contract TestContract {
    b: B;

    init() {
        self.b = B{
            sub: A{ x: 5, y: 10 },
            z: 15
        };
    }
}