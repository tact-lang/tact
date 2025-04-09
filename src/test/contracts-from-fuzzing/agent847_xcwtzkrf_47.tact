struct OptionalStructTop {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalTopField {
    field: OptionalStructTop?;

    init() {
        self.field = null;
    }
}