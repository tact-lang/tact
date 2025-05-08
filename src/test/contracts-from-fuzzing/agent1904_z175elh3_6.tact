struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Address;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Slice?;
    f10: Address?;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Slice;
    f15: Address;
}

contract Test {
    large: LargeStruct;

    init() {
        self.large = LargeStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: emptyCell().asSlice(),
            f5: myAddress(),
            f6: null,
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: 11,
            f12: false,
            f13: "b",
            f14: emptyCell().asSlice(),
            f15: myAddress(),
        };
    }
}