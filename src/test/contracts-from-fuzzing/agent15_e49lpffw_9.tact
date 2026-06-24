struct OptionalLayer {
    optInt: Int?;
    optBool: Bool?;
}

contract OptionalFields {
    data: OptionalLayer;

    init() {
        self.data = OptionalLayer{
            optInt: null,
            optBool: null
        };
    }
}