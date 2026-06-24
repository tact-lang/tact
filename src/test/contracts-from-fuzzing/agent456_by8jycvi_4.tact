struct OptionalFields {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            x: null,
            y: true,
            z: null
        };
    }
}