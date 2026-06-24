struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Int;
    f8: String;
    f9: Bool;
    f10: Int?;
}

contract LongStructContract {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1: 1,
            f2: true,
            f3: "x",
            f4: null,
            f5: null,
            f6: false,
            f7: 7,
            f8: "y",
            f9: false,
            f10: null
        };
    }
}