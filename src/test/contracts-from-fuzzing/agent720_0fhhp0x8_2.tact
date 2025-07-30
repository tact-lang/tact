struct ManyTypes {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: String;
    sl: Slice;
    bl: Builder;
}

contract BigStorage {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            i: 10,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: "abc",
            sl: emptyCell().asSlice(),
            bl: beginCell(),
        };
    }
}