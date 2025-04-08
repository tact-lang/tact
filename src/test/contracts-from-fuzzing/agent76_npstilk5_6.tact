struct LargeStruct {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int;
    f5: String;
    f6: Bool;
    f7: Int;
    f8: String;
    f9: Bool;
    f10: Int;
}

contract LargeStructContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: "2",
            f3: true,
            f4: 4,
            f5: "5",
            f6: false,
            f7: 7,
            f8: "8",
            f9: true,
            f10: 10,
        };
    }
}