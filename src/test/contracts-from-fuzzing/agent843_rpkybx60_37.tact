struct SInner {
    x: Int;
    y: Bool?;
}

struct SOuter {
    inner: SInner?;
    z: Int;
}

contract OptMiddleStruct {
    data: SOuter;

    init() {
        self.data = SOuter{
            inner: SInner{ x: 5, y: null },
            z: 42
        };
    }
}
