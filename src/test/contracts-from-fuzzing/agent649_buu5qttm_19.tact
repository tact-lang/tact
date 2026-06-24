contract MixedSerialization {
    a: Int as uint8 = 1;
    b: Int as uint16 = 2;
    c: Int as uint32 = 3;
    d: Int as int64 = 4;
    e: Int as uint128 = 5;
    f: Int = 6;
    receive() {
        let _ = self.f;
    }
}