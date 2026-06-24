struct InnerMost {
    x: Int as uint8;
}

struct Mid {
    inner: InnerMost;
    y: Int as uint16;
}

struct Outer {
    middle: Mid;
    z: Int as uint32;
}

contract SerializeWidths {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Mid{ inner: InnerMost{ x: 1 }, y: 300 },
            z: 70000
        };
    }
}