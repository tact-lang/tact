struct MultipleOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
}

contract Opts {
    f: MultipleOptionals;

    init() {
        self.f = MultipleOptionals{
            intOpt: null,
            boolOpt: null,
            stringOpt: null,
            addrOpt: null,
            cellOpt: null,
            sliceOpt: null
        };
    }
}