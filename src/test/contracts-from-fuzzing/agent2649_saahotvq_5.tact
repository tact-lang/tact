struct LongStruct {
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

contract LongFieldsTest {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1: 1,
            f2: true,
            f3: "abc",
            f4: 4,
            f5: false,
            f6: "def",
            f7: 7,
            f8: true,
            f9: "ghi",
            f10: 10,
        };
    }
}