struct A {
    b: Int;
}

struct B {
    a: A;
    opt: Int?;
    flag: Bool;
}

contract NestedMix {
    nested: B;

    init() {
        self.nested = B{
            a: A{ b:5 },
            opt: null,
            flag: true
        };
    }
}
