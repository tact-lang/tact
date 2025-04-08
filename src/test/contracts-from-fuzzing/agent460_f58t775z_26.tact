struct OptionalFields {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract StructDefaultNull {
    data: OptionalFields = OptionalFields{
        x: null,
        y: null,
        z: null
    };
    init() {
        self.data = OptionalFields{
            x: null,
            y: null,
            z: null
        };
    }
}
