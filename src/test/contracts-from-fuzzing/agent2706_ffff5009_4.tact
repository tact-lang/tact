struct OptionalFields {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeAddr: Address?;
    maybeCell: Cell?;
    maybeSlice: Slice?;
    maybeString: String?;
}

contract OptStructStorage {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            maybeInt: null,
            maybeBool: null,
            maybeAddr: null,
            maybeCell: null,
            maybeSlice: null,
            maybeString: null,
        };
    }
}