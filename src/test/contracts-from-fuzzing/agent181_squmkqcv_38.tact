struct WithStrings {
    s1: String;
    s2: String?;
}

contract StringVariants {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            s1: "abc",
            s2: null,
        };
    }
}
