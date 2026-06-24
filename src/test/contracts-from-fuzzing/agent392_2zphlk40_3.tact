struct OptionalFields {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            x: null,
            y: null,
            z: null
        };
    }
}
