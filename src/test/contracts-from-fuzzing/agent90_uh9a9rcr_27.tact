struct PrimOpts {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    cellOpt: Cell?;
    builderOpt: Builder?;
    sliceOpt: Slice?;
    addressOpt: Address?;
}

contract PrimOptsContract {
    data: PrimOpts;
    init() {
        self.data = PrimOpts{
            intOpt: null,
            boolOpt: null,
            stringOpt: null,
            cellOpt: null,
            builderOpt: null,
            sliceOpt: null,
            addressOpt: null
        };
    }
}