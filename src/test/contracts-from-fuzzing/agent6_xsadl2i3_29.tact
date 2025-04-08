struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

contract Composite {
    b: B;
    init() {
        self.b = B{
            y: 9,
            a: A{
                x: 42,
            },
        };
    }
}