struct TinyInts {
    flag: Int as uint1;
    signedBit: Int as int1;
}

contract TinyIntStorage {
    tin: TinyInts;

    init() {
        self.tin = TinyInts{
            flag: 1,
            signedBit: -1,
        };
    }
}
