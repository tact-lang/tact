struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TripleStrings {
    ws: WithStrings;
    init() {
        self.ws = WithStrings{ s1: "a", s2: "b", s3: "c" };
    }
}