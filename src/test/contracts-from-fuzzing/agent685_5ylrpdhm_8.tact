struct StructA {
    x: Int;
    y: Bool;
}

struct StructB {
    a: StructA;
    b: StructA;
}

contract StoreTwoNestedStructs {
    s: StructB;

    init() {
        self.s = StructB{
            a: StructA{ x: 1, y: true },
            b: StructA{ x: 2, y: false }
        };
    }
}