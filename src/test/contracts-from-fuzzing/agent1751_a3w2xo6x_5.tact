struct OptionalFields {
    number: Int?;
    text: String?;
    flag: Bool?;
    address: Address?;
    cell: Cell?;
}

contract OptionalFieldsState {
    opts: OptionalFields;

    init() {
        self.opts = OptionalFields{
            number: null,
            text: null,
            flag: null,
            address: null,
            cell: null,
        };
    }
}
