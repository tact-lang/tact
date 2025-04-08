struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
    f11: Bool?;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Int?;
    f17: Bool?;
    f18: String;
    f19: Int;
    f20: Bool;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: null,
            f6: "b",
            f7: 2,
            f8: false,
            f9: "c",
            f10: null,
            f11: null,
            f12: "d",
            f13: 3,
            f14: true,
            f15: "e",
            f16: null,
            f17: null,
            f18: "f",
            f19: 4,
            f20: false,
        };
    }
}