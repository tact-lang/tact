struct Compose {
    addr: Address;
    slice: Slice;
    cell: Cell;
    text: String;
    flag: Bool;
}

contract ComposeTest {
    dat: Compose;

    init() {
        self.dat = Compose{
            addr: myAddress(),
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            text: "abc",
            flag: true,
        };
    }
}
