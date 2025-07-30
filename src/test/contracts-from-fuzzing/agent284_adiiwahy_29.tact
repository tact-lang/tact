struct SInner {
    x: Int;
}

struct SOuter {
    a: Int;
    b: SInner;
    c: Int;
}

contract StructMidNested {
    store: SOuter;
    init() {
        self.store = SOuter{
            a: 1,
            b: SInner{ x: 5 },
            c: 3
        };
    }
}