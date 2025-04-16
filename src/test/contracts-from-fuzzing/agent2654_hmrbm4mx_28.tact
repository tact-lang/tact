struct Complex {
    num: Int;
    txt: String;
    flag: Bool;
    addr: Address;
    cellData: Cell;
    sliceData: Slice;
    strOpt: String?;
    intOpt: Int?;
}

contract StructAllTypes {
    val: Complex;

    init() {
        self.val = Complex{
            num:1,
            txt:"x",
            flag:true,
            addr:myAddress(),
            cellData:emptyCell(),
            sliceData:emptyCell().asSlice(),
            strOpt:null,
            intOpt:null
        };
    }
}