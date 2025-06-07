struct Bundle {
    text: String;
    dataSlice: Slice;
    dataCell: Cell;
    addr: Address;
}

contract Test {
    saved: Bundle;

    init() {
        self.saved = Bundle{
            text: "",
            dataSlice: emptyCell().asSlice(),
            dataCell: emptyCell(),
            addr: myAddress(),
        };
    }
}