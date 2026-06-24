struct NestedA {
    x: Int;
}

struct NestedB {
    a: NestedA;
    z: Int;
}

contract CrossNested {
    b: NestedB;

    init() {
        self.b = NestedB{
            a: NestedA{ x: 123 },
            z: 456
        };
    }
}
