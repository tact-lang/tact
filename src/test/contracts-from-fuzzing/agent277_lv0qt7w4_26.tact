struct WithStrings {
    s1: String;
    s2: String?;
}

contract Test {
    field: WithStrings;
    init() {
        self.field = WithStrings{ s1: "hello", s2: null };
    }
}