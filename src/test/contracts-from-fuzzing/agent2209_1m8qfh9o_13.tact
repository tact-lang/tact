struct WithStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract TestContract {
    content: WithStrings;
    init() {
        self.content = WithStrings{
            s1: "hello",
            s2: null,
            s3: "world",
            s4: null,
        };
    }
}