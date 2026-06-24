struct Rec {
    int1: Int;
    bool1: Bool;
    str1: String;
    slice1: Slice;
    cell1: Cell;
    addr1: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddr: Address?;
}

contract TestVars {
    rec: Rec;

    init() {
        self.rec = Rec{
            int1: 10,
            bool1: true,
            str1: "abc",
            slice1: emptyCell().asSlice(),
            cell1: emptyCell(),
            addr1: myAddress(),
            optInt: null,
            optBool: null,
            optStr: null,
            optSlice: null,
            optCell: null,
            optAddr: null,
        };
    }
}