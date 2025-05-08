struct LongStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Bool;
    f6: String;
    f7: String;
    f8: Int;
    f9: Bool;
    f10: String;
}

contract ManyFieldsContract {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: true,
            f5: false,
            f6: "a",
            f7: "b",
            f8: 8,
            f9: true,
            f10: "end"
        };
    }
}
