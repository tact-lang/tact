struct SInner {
    b: Bool;
}

struct SOuter {
    s: SInner;
}

contract StructInStruct {
    field: SOuter;

    init() {
        self.field = SOuter{ s: SInner{ b: true } };
    }
}