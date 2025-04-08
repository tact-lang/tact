struct OptIntBool {
    x: Int?;
    y: Bool?;
}

contract OptFields {
    field: OptIntBool;

    init() {
        self.field = OptIntBool{ x: null, y: true };
    }
}