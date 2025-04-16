struct A {
    x: Int;
    y: Bool;
}

struct B {
    p: A;
    q: A;
}

struct C {
    b1: B;
    b2: B;
}

contract DeepNestingTest {
    deep: C = C {
        b1: B {
            p: A { x: 1, y: true },
            q: A { x: 2, y: false }
        },
        b2: B {
            p: A { x: 3, y: true },
            q: A { x: 4, y: false }
        }
    };
    init() {}
}