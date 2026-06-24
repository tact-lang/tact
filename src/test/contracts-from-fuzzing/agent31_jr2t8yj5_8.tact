struct StructA {
    x: Int;
}

struct StructB {
    y: Int;
    z: StructA;
}

contract TestContract {
    data: StructB;
    init() {
        self.data = StructB{ y: 1, z: StructA{ x: 2 } };
    }
}
