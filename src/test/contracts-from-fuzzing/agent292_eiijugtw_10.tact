struct StructA {
    x: Int;
    y: Int;
}

struct StructB {
    s: StructA;
    z: Int;
}

struct StructC {
    b: StructB;
    q: Int as uint4;
}

contract NestedDifferentSerializations {
    data: StructC;

    init() {
        self.data = StructC{
            b: StructB{ s: StructA{x:1,y:2}, z:3 },
            q: 4
        };
    }
}