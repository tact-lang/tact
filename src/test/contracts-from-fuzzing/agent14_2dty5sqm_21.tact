contract TestSerializedMapOverflow {
    // Expect error: key value 300 cannot be represented as uint8
    m: map<Int as uint8, Int as uint8> = emptyMap();
    init() {
        // 300 is out of [0,255] range for uint8, should yield an error
        self.m.set(300, 10);
    }
}
