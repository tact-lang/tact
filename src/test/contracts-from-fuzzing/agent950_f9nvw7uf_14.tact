struct BoolMix {
    flag1: Bool;
    flag2: Bool?;
    flag3: Bool;
    flag4: Bool?;
    flag5: Bool;
}

contract BoolMixC {
    bm: BoolMix;

    init() {
        self.bm = BoolMix{
            flag1: true,
            flag2: null,
            flag3: false,
            flag4: null,
            flag5: true
        };
    }
}