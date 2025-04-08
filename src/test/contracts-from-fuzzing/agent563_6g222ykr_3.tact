struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    optA: A?;
}

struct C {
    b: B;
    optB: B?;
}

contract DeepOptionals {
    state: C;

    init() {
        self.state = C{
            b: B{
                a: A{ x: 1, y: 2 },
                optA: null,
            },
            optB: null,
        };
    }
}