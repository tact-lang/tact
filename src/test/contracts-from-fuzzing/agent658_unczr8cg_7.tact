struct OptionalFieldNest {
    innerOptInt: Int?;
    innerOptBool: Bool?;
}

contract OptionalStructField {
    nested: OptionalFieldNest;

    init() {
        self.nested = OptionalFieldNest{
            innerOptInt: null,
            innerOptBool: null
        };
    }
}