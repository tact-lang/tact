struct WideStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Address;
    f8: Address?;
    f9: Cell;
    f10: Cell?;
}

contract WideTest {
    data: WideStruct;
    init() {
        self.data = WideStruct{
            f1: 1,
            f2: true,
            f3: null,
            f4: null,
            f5: "hi",
            f6: null,
            f7: myAddress(),
            f8: null,
            f9: emptyCell(),
            f10: null,
        };
    }
}