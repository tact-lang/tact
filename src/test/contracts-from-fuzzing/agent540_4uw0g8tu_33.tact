struct StructA {
    x: Int;
    y: Int?;
}

struct StructB {
    z: Int;
    s: StructA;
}

contract NestedSerialize {
    val: StructB;

    init() {
        self.val = StructB{
            z: 1,
            s: StructA{ x: 2, y: null }
        };
    }
}