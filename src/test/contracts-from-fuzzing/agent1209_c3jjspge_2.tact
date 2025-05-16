struct ManyBools {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
    flag7: Bool;
    flag8: Bool;
    flag9: Bool;
    flag10: Bool;
}

contract Flags {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{
            flag1: true,
            flag2: true,
            flag3: true,
            flag4: true,
            flag5: true,
            flag6: true,
            flag7: true,
            flag8: true,
            flag9: true,
            flag10: true,
        };
    }
}
