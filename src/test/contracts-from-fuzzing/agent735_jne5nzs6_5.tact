struct SerialInner {
    a: Int as uint8;
    b: Int as int16;
}

struct SerialOuter {
    id: Int as uint32;
    data: SerialInner;
}

contract SerializationNested {
    info: SerialOuter;

    init() {
        self.info = SerialOuter{
            id: 12345,
            data: SerialInner{
                a: 255,
                b: -32768,
            },
        };
    }
}
