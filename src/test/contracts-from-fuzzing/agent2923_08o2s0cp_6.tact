struct A {
    n: Int;
}

struct B {
    a1: A;
    a2: A;
}

contract StructArrayEmulation {
    b: B;

    init() {
        self.b = B{
            a1: A{n:1},
            a2: A{n:2}
        };
    }
}