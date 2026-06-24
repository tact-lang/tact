struct BigStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    b1: Bool;
    b2: Bool;
    addr: Address;
    cell1: Cell;
    slice1: Slice;
    str1: String;
}

contract Test {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            i1: 1,
            i2: 2,
            i3: 3,
            b1: true,
            b2: false,
            addr: myAddress(),
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
            str1: "hi"
        };
    }
}