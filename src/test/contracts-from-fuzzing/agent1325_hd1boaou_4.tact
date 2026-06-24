struct OptionalNested {
    maybeInt: Int?;
    maybeBool: Bool?;
}

contract TestContract {
    optionalData: OptionalNested;

    init() {
        self.optionalData = OptionalNested{
            maybeInt: null,
            maybeBool: true
        };
    }

    receive() {
        self.optionalData = OptionalNested{
            maybeInt: 42,
            maybeBool: null
        };
    }
}