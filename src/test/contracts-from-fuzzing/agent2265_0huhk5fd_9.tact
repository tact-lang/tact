struct Options {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    sliceOpt: Slice?;
    strOpt: String?;
    cellOpt: Cell?;
}

contract LoadsOfOptionals {
    opts: Options;

    init() {
        self.opts = Options{
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            sliceOpt: null,
            strOpt: null,
            cellOpt: null,
        };
    }
}