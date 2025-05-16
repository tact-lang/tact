struct TenFields {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: String;
    f6: String?;
    f7: Int?;
    f8: Bool?;
    f9: String;
    f10: Int;
}

contract BigStruct {
    val: TenFields;

    init() {
        self.val = TenFields{
            f1: 1, f2: true, f3: 3, f4: false, f5: "a",
            f6: null, f7: 7, f8: null, f9: "b", f10: 10
        };
    }
}