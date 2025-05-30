struct StructA {
    value: Int;
}

struct StructB {
    inner: StructA;
}

contract Flattened {
    a: StructA;
    b: StructB;

    init() {
        self.a = StructA{ value: 1 };
        self.b = StructB{ inner: StructA{ value: 2 } };
    }
}