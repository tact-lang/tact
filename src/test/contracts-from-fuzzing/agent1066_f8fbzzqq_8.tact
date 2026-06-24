struct Combo {
    num: Int;
    text: String;
    flag: Bool;
    maybeNum: Int?;
    maybeFlag: Bool?;
    maybeText: String?;
    cell: Cell;
    slice: Slice;
    addr: Address;
}

contract ComboStore {
    stuff: Combo;

    init() {
        self.stuff = Combo{
            num: 8,
            text: "text",
            flag: true,
            maybeNum: 42,
            maybeFlag: null,
            maybeText: null,
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}