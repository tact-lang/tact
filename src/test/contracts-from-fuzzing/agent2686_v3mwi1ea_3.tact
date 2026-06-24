struct OptionalNest {
    name: String;
    number: Int?;
    innerFlag: Bool?;
}

contract OptNestedTest {
    optData: OptionalNest;

    init() {
        self.optData = OptionalNest{
            name: "Bob",
            number: null,
            innerFlag: true
        };
    }
}
