struct OptionalLayer {
    optionalField: Int?;
}

contract OptionalStructStorage {
    data: OptionalLayer;

    init() {
        self.data = OptionalLayer { optionalField: null };
    }
}