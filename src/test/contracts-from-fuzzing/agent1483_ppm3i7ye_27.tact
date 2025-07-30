struct OptionalBool {
    b: Bool?;
}

contract OptionalBoolField {
    s: OptionalBool;

    init() {
        self.s = OptionalBool{ b: null };
    }
}