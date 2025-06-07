struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract JustStrings {
    data: WithStrings;

    init() {
        self.data = WithStrings{ s1:"a", s2:"b", s3:"c" };
    }
}