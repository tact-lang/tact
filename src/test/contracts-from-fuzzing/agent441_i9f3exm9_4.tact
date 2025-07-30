struct ManyOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;
}

contract TestContract {
    optField: ManyOptionals;
    
    init() {
        self.optField = ManyOptionals{
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            cellOpt: null,
            sliceOpt: null,
            strOpt: null
        };
    }
}
