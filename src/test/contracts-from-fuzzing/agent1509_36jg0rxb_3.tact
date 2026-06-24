struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bl: Builder;
}

contract DifferentFieldTypes {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            i: 1,
            b: true,
            s: "abc",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bl: beginCell(),
        };
    }
}
