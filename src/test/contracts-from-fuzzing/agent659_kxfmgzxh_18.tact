struct A {
    val: Int;
}

struct B {
    val: Int;
}

struct ComplexNested {
    a: A?;
    b: B?;
    flag: Bool;
}

contract OptionalStructMix {
    field: ComplexNested;

    init() {
        self.field = ComplexNested{a: null, b: null, flag: true};
    }
}
