struct Varied {
    i: Int as uint32;
    s: String;
    b: Bool;
    addr: Address;
    slice: Slice;
    cell: Cell;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OneBigNested {
    data: Varied;

    init() {
        self.data = Varied{
            i: 12345,
            s: "hello",
            b: true,
            addr: myAddress(),
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            optInt: null,
            optBool: false,
            optStr: "optional",
        };
    }

    receive() {}
}