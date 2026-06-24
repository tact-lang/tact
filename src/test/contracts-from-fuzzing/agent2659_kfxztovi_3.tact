struct OptionalFields {
    number: Int?;
    boolean: Bool?;
    addr: Address?;
    str: String?;
}

contract OptionalStorage {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            number: null,
            boolean: null,
            addr: null,
            str: null,
        };
    }
}