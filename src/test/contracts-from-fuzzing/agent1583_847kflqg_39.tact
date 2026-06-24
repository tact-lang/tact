struct WithStrings {
    s1: String?;
    s2: String?;
    s3: String;
    s4: String;
}

contract MixStrings {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            s1: null,
            s2: null,
            s3: "hello",
            s4: "world",
        };
    }
}