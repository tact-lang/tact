struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
}

contract BigFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: true,
            f3: "abc",
            f4: null,
            f5: false,
            f6: "maybe",
            f7: 7,
            f8: false,
            f9: "zzz",
            f10: 10,
        };
    }
}
