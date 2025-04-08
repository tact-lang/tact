struct OptionalsInStruct {
    flag1: Bool?;
    flag2: Bool?;
    flag3: Bool?;
    flag4: Bool?;
}

contract OptionalFlags {
    flags: OptionalsInStruct;

    init() {
        self.flags = OptionalsInStruct{
            flag1: null,
            flag2: null,
            flag3: null,
            flag4: null,
        };
    }
}