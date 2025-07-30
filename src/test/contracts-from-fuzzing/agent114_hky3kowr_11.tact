struct WideStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Address;
    f6: Bool?;
    f7: String?;
    f8: Int?;
}

contract WideStructContract {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            f1: 1,
            f2: 2,
            f3: false,
            f4: "hi",
            f5: myAddress(),
            f6: null,
            f7: null,
            f8: null,
        };
    }
}