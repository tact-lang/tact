struct OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
}

contract ManyOptionals {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
            optStr: null,
        };
    }
}