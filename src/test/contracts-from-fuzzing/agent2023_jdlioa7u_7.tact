struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: Address?;
    f10: String?;
    f11: Int;
    f12: Bool;
    f13: Address;
    f14: Cell;
    f15: Slice;
    f16: String;
    f17: Int?;
    f18: Bool?;
    f19: Address?;
    f20: String?;
}

contract TestContract {
    bigData: BigStruct;

    init() {
        self.bigData = BigStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "str",
            f7: null,
            f8: false,
            f9: null,
            f10: "hi",
            f11: 2,
            f12: false,
            f13: myAddress(),
            f14: emptyCell(),
            f15: emptyCell().asSlice(),
            f16: "str2",
            f17: 5,
            f18: null,
            f19: myAddress(),
            f20: null,
        };
    }

    receive() {
        let x = self.bigData.f20;
    }
}