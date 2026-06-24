struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: Bool?;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
}

contract BigStructContract {
    s: BigStruct;
    init() {
        self.s = BigStruct{
            f1: 1,
            f2: false,
            f3: "test",
            f4: myAddress(),
            f5: null,
            f6: null,
            f7: "more",
            f8: myAddress(),
            f9: 9,
            f10: true,
        };
    }
}