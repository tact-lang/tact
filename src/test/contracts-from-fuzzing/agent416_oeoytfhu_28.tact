struct AStruct {
    av: Int;
}

struct BStruct {
    bv: Int;
}

contract Test28 {
    a: AStruct;
    b: BStruct;

    init() {
        self.a = AStruct{ av: 123 };
        self.b = BStruct{ bv: 456 };
    }
}
