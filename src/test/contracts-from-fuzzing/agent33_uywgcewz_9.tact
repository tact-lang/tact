struct LargeMixed {
    int1: Int;
    bool1: Bool;
    addr1: Address;
    str1: String;
    cell1: Cell;
    slice1: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract TestContract {
    storage: LargeMixed;

    init() {
        self.storage = LargeMixed{
            int1: 5,
            bool1: false,
            addr1: myAddress(),
            str1: "L",
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optAddr: null,
            optStr: null,
            optCell: null,
            optSlice: null,
        };
    }
}