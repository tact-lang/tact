struct BigStruct {
    f1: Int;
    f2: Int?;
    f3: Int;
    f4: Int?;
    f5: Int;
    f6: Int?;
    f7: Int;
    f8: Int?;
    f9: Int;
    f10: Int?;
    f11: Int;
    f12: Int?;
    f13: Int;
    f14: Int?;
    f15: Int;
    f16: Int?;
    f17: Int;
    f18: Int?;
    f19: Int;
    f20: Int?;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct {
            f1: 1, f2: null, f3: 3, f4: null, f5: 5, f6: null,
            f7: 7, f8: null, f9: 9, f10: null, f11: 11, f12: null,
            f13: 13, f14: null, f15: 15, f16: null, f17: 17, f18: null,
            f19: 19, f20: null
        };
    }
}