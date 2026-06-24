struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

contract TestReusedStructs {
    first: StructA;
    second: StructB;

    init() {
        self.first = StructA{ a: 10 };
        self.second = StructB{ b: StructA{ a: 20 } };
    }
}
