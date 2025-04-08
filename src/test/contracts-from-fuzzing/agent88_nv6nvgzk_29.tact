struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

contract Nesting {
    field: B;

    init() {
        self.field = B {
            y: 10,
            a: A {
                x: 20
            }
        };
    }
}