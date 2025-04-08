struct BoolMix {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool?;
}

contract BoolFields {
    flags: BoolMix;

    init() {
        self.flags = BoolMix{
            flag1: true,
            flag2: false,
            flag3: null
        };
    }
}