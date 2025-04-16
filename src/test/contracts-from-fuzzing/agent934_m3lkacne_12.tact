struct PackedDifferent {
    s1: Int as uint4;
    s2: Int as int8;
    bl: Bool;
    s3: Int; // default 257-bit signed
}

contract PackedMixed {
    storage: PackedDifferent;

    init() {
        self.storage = PackedDifferent{
            s1: 3,
            s2: -7,
            bl: false,
            s3: 1234567890,
        };
    }
}