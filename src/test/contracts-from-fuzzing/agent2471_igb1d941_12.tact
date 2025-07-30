struct BigOptions {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    stringOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
}

contract ContractOpt {
    opts: BigOptions;

    init() {
        self.opts = BigOptions{
            intOpt: null,
            boolOpt: true,
            addrOpt: null,
            stringOpt: null,
            cellOpt: null,
            sliceOpt: null,
        };
    }
}