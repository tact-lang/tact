struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Cell;
    f10: Address;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Cell;
    f15: Address;
    f16: Int;
}

contract Test5 {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: emptyCell(),
            f5: myAddress(),
            f6: 2,
            f7: false,
            f8: "b",
            f9: emptyCell(),
            f10: myAddress(),
            f11: 3,
            f12: true,
            f13: "c",
            f14: emptyCell(),
            f15: myAddress(),
            f16: 4
        };
    }
}