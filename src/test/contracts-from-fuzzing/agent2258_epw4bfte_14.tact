contract MixedSerialization {
    a: Int as uint8 = 1;
    b: Int as int16 = 2;
    c: Int as int64 = 3;
    d: Int as uint256 = 4;
    receive() {
        let _ = self.d;
    }
}