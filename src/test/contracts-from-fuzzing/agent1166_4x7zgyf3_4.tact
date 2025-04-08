struct WideStruct {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Bool?;
    f5: Int?;
    f6: String?;
    f7: Bool;
    f8: String;
    f9: Int;
    f10: String?;
}

contract WideStructContract {
    s: WideStruct;

    init() {
        self.s = WideStruct{
            f1: 1,
            f2: "two",
            f3: true,
            f4: null,
            f5: null,
            f6: null,
            f7: false,
            f8: "eight",
            f9: 9,
            f10: null
        };
    }
}
