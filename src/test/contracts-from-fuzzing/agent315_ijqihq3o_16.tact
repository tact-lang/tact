struct InnerStruct {
    int1: Int;
    bool1: Bool;
    str1: String;
    cell1: Cell;
    addr1: Address;
    sl1: Slice;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract StructFieldTest {
    field: InnerStruct;

    init() {
        self.field = InnerStruct{
            int1: 1,
            bool1: false,
            str1: "hi",
            cell1: emptyCell(),
            addr1: myAddress(),
            sl1: emptyCell().asSlice(),
            intOpt: null,
            boolOpt: null,
            strOpt: null,
        };
    }
}