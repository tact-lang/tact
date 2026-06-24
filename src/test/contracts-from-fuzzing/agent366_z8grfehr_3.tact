struct Deep {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    cell: Cell;
    slice: Slice;
    optInt: Int?;
    optStr: String?;
}

contract NestedTest {
    data: Deep;

    init() {
        self.data = Deep{
            i: 42,
            b: true,
            s: "x",
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            optInt: null,
            optStr: null,
        };
    }
}