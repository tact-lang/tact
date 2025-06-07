struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Address;
}

contract LargeStructContract {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            f1: 1,
            f2: true,
            f3: "hello",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: false,
            f8: 42,
            f9: "world",
            f10: myAddress(),
        };
    }
}