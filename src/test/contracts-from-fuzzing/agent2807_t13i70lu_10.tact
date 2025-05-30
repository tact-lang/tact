struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract PrimStruct {
    val: Mixed;
    init() {
        self.val = Mixed{
            a: 1,
            b: false,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}