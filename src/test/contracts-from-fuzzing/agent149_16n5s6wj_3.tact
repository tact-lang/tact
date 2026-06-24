struct Nested {
    innerFlag: Bool;
    optInt: Int?;
    text: String;
}

contract OptionalNestedTest {
    nested: Nested;

    init() {
        self.nested = Nested{
            innerFlag: true,
            optInt: null,
            text: "Hello",
        };
    }
}