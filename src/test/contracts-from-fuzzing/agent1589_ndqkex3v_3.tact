struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: Bool?;
    f6: Int;
    f7: String;
    f8: Bool;
    f9: Int?;
    f10: String;
}

contract LargeFieldsContract {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            f1: 1,
            f2: true,
            f3: null,
            f4: "a",
            f5: false,
            f6: 6,
            f7: "b",
            f8: true,
            f9: 9,
            f10: "c",
        };
    }
}