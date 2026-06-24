struct MixSerOpt {
    a: Int as int8;
    b: Int?;
    c: Int as uint32;
    d: Int?;
}

contract PersistMixSerOpt {
    val: MixSerOpt;
    init() {
        self.val = MixSerOpt{ a: -5, b: null, c: 12345, d: 6 };
    }
}