struct OptionalNest {
    innerInt: Int?;
    innerBool: Bool?;
    innerStr: String?;
}

contract OptionalFields {
    optField: OptionalNest;

    init() {
        self.optField = OptionalNest{
            innerInt: null,
            innerBool: true,
            innerStr: null
        };
    }
}