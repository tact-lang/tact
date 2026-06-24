struct MixSerializeOptional {
    a: Int?; // nullable
    b: Int as uint8;
    c: Bool?;
    d: Int as int64;
}

contract OptSerialize {
    s: MixSerializeOptional;

    init() {
        self.s = MixSerializeOptional{
            a: null,
            b: 255,
            c: null,
            d: -999
        };
    }
}