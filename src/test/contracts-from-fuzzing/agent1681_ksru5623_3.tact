struct WideStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Int?;
    f6: Bool?;
    f7: String?;
    f8: Cell?;
    f9: Address;
    f10: Address?;
    f11: Int;
    f12: Int?;
}

contract WideStructTest {
    state: WideStruct;

    init() {
        self.state = WideStruct {
            f1: 1,
            f2: true,
            f3: "hello",
            f4: emptyCell(),
            f5: null,
            f6: null,
            f7: null,
            f8: null,
            f9: myAddress(),
            f10: null,
            f11: 100,
            f12: null,
        };
    }
}