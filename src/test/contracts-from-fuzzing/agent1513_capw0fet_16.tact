struct SerializeFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract SerializedFields {
    s: SerializeFormats;

    init() {
        self.s = SerializeFormats{ a:1,b:2,c:3,d:4 };
    }
}