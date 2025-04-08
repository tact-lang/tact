struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String?;
    f4: Bool?;
    f5: Int;
    f6: String;
    f7: Bool;
    f8: Int;
    f9: Bool;
    f10: String?;
}

contract LongFields {
    val: LongStruct;

    init() {
        self.val = LongStruct{
            f1: 1,
            f2: true,
            f3: null,
            f4: false,
            f5: 5,
            f6: "string",
            f7: true,
            f8: 8,
            f9: false,
            f10: "optional",
        };
    }
}