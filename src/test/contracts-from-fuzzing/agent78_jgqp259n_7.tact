struct HugeStruct {
    f1: Int;
    f2: Bool;
    f3: Bool?;
    f4: Int;
    f5: Int?;
    f6: Bool;
    f7: Bool?;
    f8: Int;
    f9: Int;
    f10: Bool?
}

contract BigFields {
    huge: HugeStruct;

    init() {
        self.huge = HugeStruct {
            f1: 1,
            f2: true,
            f3: null,
            f4: 4,
            f5: 5,
            f6: false,
            f7: true,
            f8: 8,
            f9: 9,
            f10: null,
        };
    }
}