struct OptionalFields {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructFields {
    val: OptionalFields;

    init() {
        self.val = OptionalFields{
            x: null,
            y: null,
            z: null,
        };
    }
}