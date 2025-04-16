struct SInner {
    x: Int as int128;
    y: Int as uint128;
}

struct SOuter {
    a: SInner;
    b: SInner;
}

contract SerializeNested {
    data: SOuter;

    init() {
        self.data = SOuter{
            a: SInner{ x: -123456789, y: 123456789 },
            b: SInner{ x: -987654321, y: 987654321 }
        };
    }
}