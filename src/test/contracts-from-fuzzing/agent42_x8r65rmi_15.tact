struct StructA {
    f1: Int;
}

struct StructB {
    f2: Int;
}

struct StructC {
    sA: StructA;
    sB: StructB;
}

contract TestContract {
    data: StructC;

    init() {
        self.data = StructC{
            sA: StructA{ f1: 1 },
            sB: StructB{ f2: 2 }
        };
    }
}