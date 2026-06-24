contract MixedSerialization {
    a: Int as uint8;
    b: Int as int128;
    c: Int = 5;
    d: Int?;
    e: Int? as uint16;

    init() {
        self.a = 1;
        self.b = 2;
        self.d = null;
        self.e = null;
    }
}
