struct TinyBits {
    signedBit: Int as int1;
    unsignedBit: Int as uint1;
}

contract Test48 {
    data: TinyBits;

    init() {
        self.data = TinyBits{
            signedBit: 0,
            unsignedBit: 1,
        };
    }
}