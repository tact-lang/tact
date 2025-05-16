struct WideStruct {
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

contract WideStore {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: null,
            f6: "hello",
            f7: 7,
            f8: false,
            f9: "world",
            f10: 10
        };
    }
}