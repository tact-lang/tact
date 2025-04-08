struct ManyBools {
    flag0: Bool;
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
    flag7: Bool;
    flag8: Bool;
    flag9: Bool;
}

contract TestContract {
    data: ManyBools;

    init() {
        self.data = ManyBools{
            flag0: true,
            flag1: false,
            flag2: true,
            flag3: false,
            flag4: true,
            flag5: false,
            flag6: true,
            flag7: false,
            flag8: true,
            flag9: false
        };
    }
}