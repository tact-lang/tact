struct TinyInts {
    flag: Int as uint1;
    signedBit: Int as int1;
}

contract OutOfRangeBit {
    tin: TinyInts;

    init() {
        self.tin = TinyInts{
            flag: 2,        // invalid for uint1, exceeds max
            signedBit: -1,  // valid
        };
    }
}
