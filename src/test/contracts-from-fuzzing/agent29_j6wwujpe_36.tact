struct StructBigOpt {
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;
}

contract StructBigOptContract {
    field: StructBigOpt = StructBigOpt{
        optInt:null, optBool:null, optCell:null, optSlice:null, optAddr:null
    };
}