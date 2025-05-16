struct MixSerial {
    a: Int as int8;
    b: Int as uint16;
    c: Int;
    d: Bool;
    e: String;
}

contract MixedSerialization {
    v: MixSerial;
    init() {
        self.v = MixSerial{ a:-100, b:65535, c:123456, d:true, e:"ok" };
    }
}