struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Address?;
    f6: Bool?;
    f7: String?;
}

contract LargeNestedStruct {
    info: LargeStruct;

    init() {
        self.info = LargeStruct{
            f1: 10,
            f2: true,
            f3: "test",
            f4: null,
            f5: null,
            f6: null,
            f7: null
        };
    }
}
