struct OptionalBoolHolder {
    test: Bool?;
}

contract OptStructOptionalField {
    data: OptionalBoolHolder?;

    init() {
        self.data = OptionalBoolHolder{ test: true };
    }
}