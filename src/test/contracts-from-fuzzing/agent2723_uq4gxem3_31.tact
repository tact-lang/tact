struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

contract BothStructs {
    left: StructA?;
    right: StructB?;
    init() {
        self.left = null;
        self.right = StructB{ b: 10 };
    }
}