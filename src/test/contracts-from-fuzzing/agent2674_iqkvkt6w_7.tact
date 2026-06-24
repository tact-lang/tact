struct HasManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract LargeStructTest {
    varStruct: HasManyFields;

    init() {
        self.varStruct = HasManyFields{
            f1: 1,
            f2: true,
            f3: "str1",
            f4: 2,
            f5: false,
            f6: "str2",
            f7: 3,
            f8: true,
            f9: "str3",
            f10: 4,
        };
    }
}