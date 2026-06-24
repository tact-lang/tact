struct OptionalNest {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract OptNestedStorage {
    optionalData: OptionalNest;

    init() {
        self.optionalData = OptionalNest{
            x: null,
            y: 42,
            z: null,
        };
    }
}
