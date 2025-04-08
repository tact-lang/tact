struct StructA {
    x: Int = 1;
}

struct StructB {
    y: Int = 2;
    nested: StructA = StructA{ x: 3 };
}

contract Test {
    fieldA: StructA = StructA{ x: 4 };
    fieldB: StructB = StructB{ y: 5, nested: StructA{ x: 6 } };
    init() {}
}