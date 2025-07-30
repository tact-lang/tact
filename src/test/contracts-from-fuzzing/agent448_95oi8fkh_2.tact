struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: Bool;
    f7: Int?;
    f8: Bool?;
    f9: Int;
    f10: Bool;
    f11: Int?;
    f12: Bool?;
    f13: Int;
    f14: Bool;
    f15: Int?;
    f16: Bool?;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2: true,
            f3: null, f4: null,
            f5: 2, f6: false,
            f7: 3, f8: true,
            f9: 4, f10: false,
            f11: 5, f12: null,
            f13: 6, f14: true,
            f15: null, f16: false,
        };
    }

    receive() {}
}