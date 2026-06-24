struct A {
    valA: Int;
}

struct B {
    valB: Int;
}

struct OuterOpt {
    a: A?;
    b: B?;
}

contract NestedOptionalStructs {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            a: null,
            b: B{valB: 42},
        };
    }
}
