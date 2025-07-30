struct ManyPrimitives {
    int1: Int;
    bool1: Bool;
    addr1: Address;
    cell1: Cell;
    slice1: Slice;
    str1: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
}

contract AllPrimitives {
    s: ManyPrimitives;
    init() {
        self.s = ManyPrimitives{
            int1: 1,
            bool1: true,
            addr1: myAddress(),
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
            str1: "hello",
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
            optStr: null
        };
    }
}
