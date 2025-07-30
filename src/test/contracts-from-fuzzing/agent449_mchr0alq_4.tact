struct OptionalLayer {
    value: Int?;
}

contract OptionalStructStorage {
    optField: OptionalLayer?;

    init() {
        self.optField = OptionalLayer{ value: 123 };
    }
}
