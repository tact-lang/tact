struct StructA {
    x: Int;
}

struct StructB {
    y: StructA;
}

struct StructC {
    z: StructB;
}

struct StructD {
    q: StructC;
}

contract DeepChain {
    data: StructD;

    init() {
        self.data = StructD{ q: StructC{ z: StructB{ y: StructA{ x: 123 } } } };
    }
}