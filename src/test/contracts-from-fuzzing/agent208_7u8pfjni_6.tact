struct LargeStruct {
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

contract Test7 {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            f1: 1,
            f2: false,
            f3: "x",
            f4: 2,
            f5: true,
            f6: "y",
            f7: 3,
            f8: false,
            f9: "z",
            f10: 4,
        };
    }
}