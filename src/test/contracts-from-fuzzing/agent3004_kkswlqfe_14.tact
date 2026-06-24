struct Complex {
    intF: Int;
    boolF: Bool;
    addr: Address;
    str: String;
    slice: Slice;
    cell: Cell;
    optInt: Int?;
    optStr: String?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
}

contract HugeTyping {
    c: Complex;

    init() {
        self.c = Complex{
            intF:1, boolF:true, addr:myAddress(), str:"hi", slice:emptyCell().asSlice(), cell:emptyCell(),
            optInt:null,optStr:null,optAddr:null,optSlice:null,optCell:null
        };
    }
}