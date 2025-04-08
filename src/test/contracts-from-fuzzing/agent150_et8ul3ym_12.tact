struct OptionSerialize {
    s1: Int? as uint32;
    s2: Int? as int16;
    flag: Bool?;
    num: Int as uint8;
}

contract OptionalSizes {
    s: OptionSerialize;

    init() {
        self.s = OptionSerialize{
            s1: null,
            s2: null,
            flag: null,
            num: 255
        };
    }
}