struct OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optStr: String?;
    optSlice: Slice?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optStr: null,
            optSlice: null
        };
    }

    receive() {}
}