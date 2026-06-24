struct WideStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool?;
    f5: String?;
    f6: String;
    f7: Slice?;
    f8: Cell;
    f9: Int;
    f10: Address?;
}

contract WideStructContract {
    s: WideStruct;

    init() {
        self.s = WideStruct{
            f1: 1,
            f2: 2,
            f3: true,
            f4: null,
            f5: null,
            f6: "zz",
            f7: null,
            f8: emptyCell(),
            f9: 9,
            f10: null,
        };
    }

    receive(){}
}