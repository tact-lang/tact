struct A {
    x: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
}

contract ReusedNested {
    b: B;

    init() {
        self.b = B {
            a1: A{x:1},
            a2: A{x:2},
            a3: A{x:3}
        };
    }
}