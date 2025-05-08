struct B {
    inner: Int;
}

struct A {
    b1: B;
    b2: B;
    b3: B;
}

contract RepeatedStructs {
    content: A;
    init() {
        self.content = A{
            b1: B{inner: 1},
            b2: B{inner: 2},
            b3: B{inner: 3},
        };
    }
}