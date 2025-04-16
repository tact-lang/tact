struct OutOfRangeSerialize {
    u8: Int as uint8;
    i16: Int as int16;
}

contract OutOfRangeDefaultVals {
    data: OutOfRangeSerialize;

    init() {
        self.data = OutOfRangeSerialize {
            u8: 256, // out of uint8
            i16: 32768 // out of int16
        };
    }
}