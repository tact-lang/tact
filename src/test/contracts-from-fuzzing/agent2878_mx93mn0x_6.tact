struct OptionalFields {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            x: null,
            y: true,
            z: null
        };
    }
}