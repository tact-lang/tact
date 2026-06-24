struct A {
    val: Int?;
}

struct B {
    a1: A;
    a2: A?;
}

struct C {
    b1: B;
    b2: B?;
    fl: Bool;
}

contract Test25 {
    state: C;

    init() {
        self.state = C{
            b1: B{
                a1: A{val: 1},
                a2: null
            },
            b2: null,
            fl: true
        };
    }
}