struct WithStrings {
    name: String;
    desc: String;
}

contract StringsTest {
    metadata: WithStrings;

    init() {
        self.metadata = WithStrings{
            name: "Fuzz",
            desc: "TestCase"
        };
    }
}