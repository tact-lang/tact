struct A {
    x: Int;
}

struct B {
    a: A;
    y: Int;
}

contract InitChain {
    field: B;

    init() {
        self.field = B{
            a: A{ x: 10 },
            y: 20
        };
    }
}