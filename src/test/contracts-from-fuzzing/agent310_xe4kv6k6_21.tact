struct WithStrings {
    s1: String;
    s2: String?;
}

contract StringsAndOptionals {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            s1: "hi",
            s2: null
        };
    }
}