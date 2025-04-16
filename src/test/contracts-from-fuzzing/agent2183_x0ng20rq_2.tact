struct LongFields {
    a1: Int;
    a2: Int;
    a3: Bool;
    a4: String;
    a5: Cell;
    a6: Slice;
    a7: Address;
    a8: String;
    a9: Bool;
    a10: Int;
    a11: Address;
    a12: Cell;
    a13: Slice;
    a14: Int;
    a15: Bool;
}

contract TestContract {
    data: LongFields;

    init() {
        self.data = LongFields{
            a1: 1,
            a2: 2,
            a3: true,
            a4: "test",
            a5: emptyCell(),
            a6: emptyCell().asSlice(),
            a7: myAddress(),
            a8: "x",
            a9: false,
            a10: 123,
            a11: myAddress(),
            a12: emptyCell(),
            a13: emptyCell().asSlice(),
            a14: 42,
            a15: true
        };
    }
}