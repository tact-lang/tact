struct SerialFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint4;
}

contract SerialTest {
    s: SerialFormats;

    init() {
        self.s = SerialFormats{a:1,b:2,c:3,d:4,e:5};
    }
}