// contract with very long optional string to test default nullability
contract OptionalStringDefault {
    name: String?;

    init() {
        self.name = null;
    }
}
