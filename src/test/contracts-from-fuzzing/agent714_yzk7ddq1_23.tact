struct MidLevel {
    foo: Int;
    bar: Leaf;
}

struct Leaf {
    x: Int;
}

contract ParallelStructs {
    left: MidLevel;
    right: MidLevel;

    init() {
        self.left = MidLevel{ foo: 1, bar: Leaf{ x: 2 } };
        self.right = MidLevel{ foo: 3, bar: Leaf{ x: 4 } };
    }
}