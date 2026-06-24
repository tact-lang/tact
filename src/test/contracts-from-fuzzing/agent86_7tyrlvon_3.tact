struct OptionalNest {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

contract OptionalTest {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{
            maybeInt: null,
            maybeBool: true,
            maybeString: null
        };
    }
}