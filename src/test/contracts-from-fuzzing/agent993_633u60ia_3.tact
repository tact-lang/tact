struct OptionalNested {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            maybeInt: null,
            maybeBool: true,
            maybeString: null
        };
    }
}