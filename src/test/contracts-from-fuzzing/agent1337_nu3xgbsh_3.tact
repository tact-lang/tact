struct HugeStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Cell;
    f6: Slice;
    f7: Address;
    f8: String;
    f9: Int;
    f10: Bool;
    f11: Int?;
    f12: Bool?;
    f13: Cell;
    f14: Slice;
    f15: Address;
    f16: String;
}

contract TestContract {
    data: HugeStruct;

    init() {
        self.data = HugeStruct{
            f1: 1, f2: true, f3: null, f4: null,
            f5: emptyCell(), f6: emptyCell().asSlice(), f7: myAddress(), f8: "Hi",
            f9: 2, f10: false, f11: null, f12: null,
            f13: emptyCell(), f14: emptyCell().asSlice(), f15: myAddress(), f16: "Bye"
        };
    }
}