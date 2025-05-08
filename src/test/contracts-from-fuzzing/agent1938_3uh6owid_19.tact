struct SerialFormats {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint124;
    e: Int as int257;
}

contract SerialFormatsTest {
    storage: SerialFormats;

    init() {
        self.storage = SerialFormats{a:1,b:2,c:3,d:4,e:5};
    }
}