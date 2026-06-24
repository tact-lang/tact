struct OnlyOptionalPrimitives {
    boolOpt: Bool?;
    intOpt: Int?;
    stringOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    addrOpt: Address?;
}

contract PureNull {
    optionals: OnlyOptionalPrimitives;

    init() {
        self.optionals = OnlyOptionalPrimitives{
            boolOpt:null,
            intOpt:null,
            stringOpt:null,
            cellOpt:null,
            sliceOpt:null,
            addrOpt:null
        };
    }
}