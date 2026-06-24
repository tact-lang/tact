struct OptDeep {
    innerInt: Int?;
    innerBool: Bool?;
}

struct OptionalContainer {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
    nested: OptDeep;
}

contract OptionalFieldsTest {
    optStore: OptionalContainer;

    init() {
        self.optStore = OptionalContainer{
            maybeInt: null,
            maybeBool: true,
            maybeStr: "abc",
            nested: OptDeep{
                innerInt: 42,
                innerBool: null,
            }
        };
    }
}