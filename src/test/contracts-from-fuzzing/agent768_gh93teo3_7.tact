struct A {
    x: Int;
}

struct B {
    y: Bool;
}

struct Combined {
    a: A;
    b: B;
}

contract ManyNestings {
    data: Combined;

    init() {
        self.data = Combined {
            a: A { x: 99 },
            b: B { y: true }
        };
    }
}