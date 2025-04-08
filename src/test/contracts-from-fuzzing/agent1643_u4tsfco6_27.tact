struct SerialNested {
    a: Int as uint8;
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int as int16;
    y: Int?;
}

contract PersistFormatsDeep {
    s: SerialNested;

    init() {
        self.s = SerialNested{
            a: 250,
            inner: InnerStruct{ x: -30000, y: null }
        };
    }
}