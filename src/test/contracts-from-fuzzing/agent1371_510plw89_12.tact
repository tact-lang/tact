struct BFlags {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
    f6: Bool?;
    f7: Bool?;
    f8: Bool?;
    f9: Bool?;
    f10: Bool?;
}

contract OptBools {
    bits: BFlags;

    init() {
        self.bits = BFlags{
            f1: true,
            f2: null,
            f3: false,
            f4: true,
            f5: null,
            f6: false,
            f7: null,
            f8: true,
            f9: null,
            f10: false
        };
    }
}
