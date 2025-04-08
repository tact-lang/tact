struct OptionalFields {
    name: String?;
    count: Int?;
    toggle: Bool?;
}

contract OptContract {
    storage: OptionalFields;

    init() {
        self.storage = OptionalFields{
            name: null,
            count: null,
            toggle: null
        };
    }
}
