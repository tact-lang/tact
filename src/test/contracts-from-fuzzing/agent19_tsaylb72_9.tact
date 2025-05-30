struct OptionalFields {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract OptionalStorage {
    content: OptionalFields;

    init() {
        self.content = OptionalFields{
            x: null,
            y: null,
            z: null,
        };
    }
}
