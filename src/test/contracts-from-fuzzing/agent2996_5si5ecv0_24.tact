struct NestedSerial {
    a: Int as uint8;
    b: InnerSer;
}

struct InnerSer {
    x: Int as int16;
    y: Int as uint32;
}

contract DeepSerial {
    data: NestedSerial;

    init() {
        self.data = NestedSerial{
            a:1,
            b: InnerSer{ x:-1, y:2 }
        };
    }
}