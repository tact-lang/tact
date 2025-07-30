struct OptMixSerial {
    a: Int as int8;
    b: Int as uint16;
    c: Int?;
    d: Bool?;
    e: String?;
}

contract MixedOptionalSerialization {
    v: OptMixSerial;
    init() {
        self.v = OptMixSerial{ a:-100, b:65535, c:null, d:null, e:null };
    }
}