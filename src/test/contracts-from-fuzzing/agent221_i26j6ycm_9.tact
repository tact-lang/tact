struct OptionalPrimitiveStruct {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    addressOpt: Address?;
}

contract OptionalAllPrimitivesContract {
    store: OptionalPrimitiveStruct;

    init() {
        self.store = OptionalPrimitiveStruct{
            intOpt: null,
            boolOpt: true,
            strOpt: null,
            cellOpt: null,
            sliceOpt: null,
            addressOpt: null
        };
    }
}