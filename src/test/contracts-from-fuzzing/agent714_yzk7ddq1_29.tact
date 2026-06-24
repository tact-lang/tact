struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

contract UninitAssign {
    foo: StructB;

    init() {
        self.foo = StructB{ b: StructA{ a: 111 } };
    }
}