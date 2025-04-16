struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool;
    f8: String;
    f9: String;
    f10: Bool?;
    f11: Int?;
    f12: String?;
}

contract ManyFields {
    st: LargeStruct;

    init() {
        self.st = LargeStruct{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4,
            f5: 5,
            f6: true,
            f7: false,
            f8: "a",
            f9: "b",
            f10: null,
            f11: null,
            f12: null,
        };
    }
}