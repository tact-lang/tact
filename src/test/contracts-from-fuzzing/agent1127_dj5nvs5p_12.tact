struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StringStorage {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma",
            s4: "delta",
        };
    }
}
