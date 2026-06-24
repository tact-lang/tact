struct A {
    i: Int;
}

struct B {
    a1: A;
    a2: A;
}

contract RepeatedStruct {
    nested: B;
    init() {
        self.nested = B{
            a1: A{ i: 1 },
            a2: A{ i: 2 },
        };
    }
}