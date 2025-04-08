struct ManyOptionals {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

contract OptionalFieldsTest {
    optData: ManyOptionals;

    init() {
        self.optData = ManyOptionals{
            maybeInt: null,
            maybeBool: true,
            maybeString: null,
        };
    }
}