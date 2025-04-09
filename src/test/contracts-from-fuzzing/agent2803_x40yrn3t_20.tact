struct AllPrimitiveOptional {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    strOpt: String?;
}

struct OuterWithAllOpt {
    nested: AllPrimitiveOptional;
    num: Int;
}

contract ContractWithNestedOptionalsPrimitives {
    state: OuterWithAllOpt;

    init() {
        self.state = OuterWithAllOpt{
            nested: AllPrimitiveOptional{
                intOpt:null,
                boolOpt:null,
                addrOpt:null,
                sliceOpt:null,
                cellOpt:null,
                strOpt:null
            },
            num: 77
        };
    }
}