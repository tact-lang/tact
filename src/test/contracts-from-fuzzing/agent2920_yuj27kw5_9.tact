struct Combo {
    num: Int;
    text: String;
    addr: Address;
    flag: Bool;
    cell: Cell;
    slice: Slice;
}

contract FullCombo {
    val: Combo;

    init() {
        self.val = Combo{
            num: 10,
            text: "hello",
            addr: myAddress(),
            flag: true,
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
        };
    }
}