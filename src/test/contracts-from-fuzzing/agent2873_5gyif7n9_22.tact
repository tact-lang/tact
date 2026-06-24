struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract MultipleStrings {
    inner: WithStrings;
    init() {
        self.inner = WithStrings{
            s1:"a",
            s2:"b",
            s3:"c"
        };
    }
}