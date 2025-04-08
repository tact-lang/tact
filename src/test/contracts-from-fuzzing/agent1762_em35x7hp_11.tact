struct VeryLarge {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int?;
    f12: Bool?;
    f13: Bool;
    f14: String;
    f15: String?;
    f16: Cell;
    f17: Cell?;
    f18: Slice;
    f19: Slice?;
    f20: Address;
    f21: Address?;
}

contract LargeStructTest {
    field: VeryLarge;

    init() {
        self.field = VeryLarge{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4,
            f5: 5,
            f6: 6,
            f7: 7,
            f8: 8,
            f9: 9,
            f10: 10,
            f11: 11,
            f12: true,
            f13: true,
            f14: "hi",
            f15: "opt",
            f16: emptyCell(),
            f17: emptyCell(),
            f18: emptyCell().asSlice(),
            f19: emptyCell().asSlice(),
            f20: myAddress(),
            f21: myAddress(),
        };
    }
}