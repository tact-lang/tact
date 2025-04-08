struct F {
    id: Int;
    flag: Bool;
    msg: String;
    addr: Address;
    cell: Cell;
    slice: Slice;
    optInt: Int?;
    optBool: Bool?;
    optMsg: String?;
}

contract ManyTypes {
    store: F;

    init() {
        self.store = F{
            id: 5,
            flag: true,
            msg: "hi",
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optMsg: null,
        };
    }
}
