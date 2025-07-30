struct MixedSerialization {
    u: Int as uint8;
    i: Int as int16;
    c: Int as coins;
}

contract MixSer {
    saved: MixedSerialization;

    init() {
        self.saved = MixedSerialization{ u: 4, i: -10, c: 9999 };
    }
}