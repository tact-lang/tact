struct HasSliceCellAddressString {
    s: Slice;
    c: Cell;
    a: Address;
    t: String;
}

contract TestContract {
    data: HasSliceCellAddressString;

    init() {
        self.data = HasSliceCellAddressString{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            a: myAddress(),
            t: "text"
        };
    }
}