struct ManyTypes {
    i: Int;
    b: Bool;
    str: String;
    addr: Address;
    c: Cell;
    sl: Slice;
    bl: Builder;
}

contract AllTypesStorage {
    val: ManyTypes;

    init() {
        self.val = ManyTypes{
            i: 1,
            b: false,
            str: "s",
            addr: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bl: beginCell(),
        };
    }
}