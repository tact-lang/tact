struct ManyOptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
}

contract ManyOptionalPrimitivesTest {
    field: ManyOptionalPrimitives;

    init() {
        self.field = ManyOptionalPrimitives{
            intOpt:null,
            boolOpt:null,
            strOpt:null,
            addrOpt:null,
            sliceOpt:null,
            cellOpt:null
        };
    }
}