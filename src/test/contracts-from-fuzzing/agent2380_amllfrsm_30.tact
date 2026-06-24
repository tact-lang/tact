struct SInner {
    x: Int as uint8;
    y: Int as int16;
}

struct SOuter {
    a: Int as uint32;
    b: Int as int64;
    c: SInner;
}

contract TestContract {
    vals: SOuter;
    init() {
        self.vals = SOuter{
            a: 12345,
            b: -123456789,
            c: SInner{ x: 250, y: -32000 }
        };
    }
}