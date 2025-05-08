contract MixedSerialization {
    a: Int as uint8 = 5;
    b: Int as int32 = -10;
    c: Int as coins = 12345;
    d: Bool = true;
    receive() {
        let _ = self.a + self.b + self.c;
    }
}