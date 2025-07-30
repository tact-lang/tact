struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
}

struct ContainsOptional {
    nestedOpt: OptionalStruct?;
    val: Int;
}

contract Test {
    complexOpt: ContainsOptional;

    init() {
        self.complexOpt = ContainsOptional{
            nestedOpt: null,
            val: 77
        };
    }
}