struct StructA {
    x: Int;
}

struct StructB {
    y: Int;
    z: StructA;
}

contract NestedStructs {
    s: StructB;

    init() {
        self.s = StructB{
            y: 101,
            z: StructA{ x: 202 },
        };
    }
}