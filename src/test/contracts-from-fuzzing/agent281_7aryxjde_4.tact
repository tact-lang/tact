struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Address;
    f5: String;
    f6: Int?;
    f7: Bool?;
    f8: Cell?;
    f9: Address?;
    f10: String?;
}

contract TestLarge {
    val: LargeStruct;

    init() {
        self.val = LargeStruct{
            f1: 1,
            f2: false,
            f3: emptyCell(),
            f4: myAddress(),
            f5: "hi",
            f6: null,
            f7: null,
            f8: null,
            f9: null,
            f10: null
        };
    }
}