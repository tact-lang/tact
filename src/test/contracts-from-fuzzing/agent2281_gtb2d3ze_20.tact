struct SInner {
    x: Int;
}

struct SOuter {
    inner: SInner?;
    y: Int?;
}

contract NestedOptStruct {
    s: SOuter;

    init() {
        self.s = SOuter{
            inner:null,
            y:null
        };
    }
}