struct OptionalFields {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            x: null,
            y: true,
            z: null,
        };
    }
}