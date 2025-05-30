struct OptionPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    strOpt: String?;
    addrOpt: Address?;
}

contract TestContract {
    opts: OptionPrimitives;

    init() {
        self.opts = OptionPrimitives{
            intOpt:null,
            boolOpt:true,
            sliceOpt:null,
            cellOpt:null,
            strOpt:null,
            addrOpt:null
        };
    }
}
