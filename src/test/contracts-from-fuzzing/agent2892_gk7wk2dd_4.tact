struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Int?;
    f6: Bool?;
    f7: Address?;
    f8: String?;
    f9: Int;
    f10: Bool;
}

contract BigFields {
    state: LongStruct;
    init() {
        self.state = LongStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: "hi",
            f5: null,
            f6: null,
            f7: null,
            f8: null,
            f9: 9,
            f10: false
        };
    }
}