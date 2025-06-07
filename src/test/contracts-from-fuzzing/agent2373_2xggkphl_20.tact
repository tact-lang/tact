struct OptionalBool {
    b: Bool?;
}

contract OptionalBoolField {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{ b: null };
    }
}