struct MultiType {
    i: Int;
    b: Bool;
    addr: Address;
    slice: Slice;
    cell: Cell;
    str: String;
}

contract TestContract {
    val: MultiType;

    init() {
        self.val = MultiType{
            i: 7,
            b: true,
            addr: myAddress(),
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            str: "test",
        };
    }
}
