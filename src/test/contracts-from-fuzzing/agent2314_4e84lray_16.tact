struct InnerSer {
    a: Int as uint8;
    b: Int as int16;
}

contract TestSerializationFormats {
    f: InnerSer;
    init() {
        self.f = InnerSer{ a: 5, b: -100 };
    }
}