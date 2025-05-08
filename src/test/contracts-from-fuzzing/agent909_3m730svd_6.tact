struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int as int32;
    f6: Int as uint16;
    f7: Int;
    f8: Bool;
    f9: Int?;
    f10: Bool?;
    f11: Int as int64;
    f12: Int as uint8;
    f13: Int;
    f14: Bool;
    f15: Int?;
    f16: Bool?;
}

contract LargeStructStorage {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            f1: 1,
            f2: true,
            f3: null,
            f4: false,
            f5: 5,
            f6: 6,
            f7: 7,
            f8: true,
            f9: null,
            f10: true,
            f11: 11,
            f12: 12,
            f13: 13,
            f14: false,
            f15: null,
            f16: false,
        };
    }
}