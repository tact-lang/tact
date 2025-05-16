struct LowBits {
    small1: Int as uint4;
    small2: Int as uint8;
    small3: Int as int5;
    someBool: Bool;
}

contract PackedBitsStorage {
    bits: LowBits;

    init() {
        self.bits = LowBits{
            small1: 8,
            small2: 200,
            small3: -10,
            someBool: true,
        };
    }
}