struct Insanity {
    i1: Int;
    i2: Bool;
    i3: String;
    i4: Bool?;
    i5: Int?;
    i6: Slice;
    i7: Address;
    i8: Cell;
    i9: String;
    i10: Bool;
    i11: Address;
    i12: Int;
    i13: Cell;
    i14: Slice;
    i15: Bool?;
    i16: Int?;
}

contract Crazy {
    insane: Insanity;

    init() {
        self.insane = Insanity{
            i1: 1,
            i2: true,
            i3: "hi",
            i4: null,
            i5: null,
            i6: emptyCell().asSlice(),
            i7: myAddress(),
            i8: emptyCell(),
            i9: "bye",
            i10: false,
            i11: myAddress(),
            i12: 42,
            i13: emptyCell(),
            i14: emptyCell().asSlice(),
            i15: false,
            i16: null,
        };
    }
}