struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
}

contract LargeStructContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: null,
            f6: "hello",
            f7: 7,
            f8: false,
            f9: "z",
            f10: 10,
        };
    }
}