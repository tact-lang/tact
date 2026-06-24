struct WithStrings {
    s1: String;
    s2: String = "default";
    s3: String?;
}

contract StringsFields {
    s: WithStrings;

    init() {
        self.s = WithStrings{
            s1: "hello",
            s3: null
        };
    }
}