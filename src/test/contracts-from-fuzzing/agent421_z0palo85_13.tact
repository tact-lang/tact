struct ManyOptionTypes {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract VariousOptionals {
    data: ManyOptionTypes;
    init() {
        self.data = ManyOptionTypes {
            optInt: null,
            optBool: null,
            optAddress: null,
            optCell: null,
            optSlice: null
        };
    }
}