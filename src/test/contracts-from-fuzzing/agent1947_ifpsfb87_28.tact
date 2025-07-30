struct Compose {
    s: String;
    addr: Address;
    cell: Cell;
    slice: Slice;
    optStr: String?;
    optAddr: Address?;
}

contract CustomCompose {
    val: Compose;
    init() {
        self.val = Compose{
            s: "hi",
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            optStr: null,
            optAddr: null,
        };
    }
}