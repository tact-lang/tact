struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: Int;
    b2: A;
    b3: Bool;
}

contract NestedMany {
    rec: B;

    init() {
        self.rec = B{
            b1: 5,
            b2: A{
                a1: 7,
                a2: false
            },
            b3: true
        };
    }
}
