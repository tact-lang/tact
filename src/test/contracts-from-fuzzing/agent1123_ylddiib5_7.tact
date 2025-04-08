struct WithStrings {
    name: String;
    greeting: String;
}

contract StringsTest {
    vals: WithStrings;

    init() {
        self.vals = WithStrings {
            name: "Alice",
            greeting: "Hello, world!"
        };
    }
}