struct LargeFlat {
    i1: Int;
    i2: Bool;
    i3: String;
    i4: Cell;
    i5: Slice;
    i6: Address;
    i7: Int?;
    i8: Bool?;
    i9: String?;
    i10: Cell?;
    i11: Slice?;
    i12: Address?;
    i13: Int;
    i14: Bool;
    i15: String;
    i16: Cell;
    i17: Slice;
    i18: Address;
}

contract Test {
    big: LargeFlat;

    init() {
        self.big = LargeFlat{
            i1: 1, i2: true, i3: "a", i4: emptyCell(), i5: emptyCell().asSlice(), i6: myAddress(),
            i7: null, i8: null, i9: null, i10: null, i11: null, i12: null,
            i13: 2, i14: false, i15: "b", i16: emptyCell(), i17: emptyCell().asSlice(), i18: myAddress(),
        };
    }
}