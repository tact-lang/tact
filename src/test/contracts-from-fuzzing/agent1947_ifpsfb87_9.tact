struct WithStrings {
    s1: String;
    s2: String?;
}

contract StringStructTest {
    param: WithStrings;
    init() {
        self.param = WithStrings{
            s1: "hey",
            s2: null,
        };
    }
}