struct StructA {
    i: Int;
}

struct StructB {
    j: Int;
    a: StructA;
}

struct StructC {
    k: Int;
    b: StructB;
}

contract CrossStructStorage {
    data: StructC;

    init() {
        self.data = StructC{
            k: 7,
            b: StructB {
                j: 8,
                a: StructA { i: 9 }
            }
        };
    }
}