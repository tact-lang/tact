struct A {
    a1: Int;
    a2: Int?;
}

struct B {
    b1: Int?;
    b2: A;
}

contract NestedOptionalFields {
    b: B;

    init() {
        self.b = B{
            b1: null,
            b2: A{
                a1: 1,
                a2: null,
            }
        };
    }
}