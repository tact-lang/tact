struct TwoStrings {
    s1: String;
    s2: String;
}

contract DoubleStr {
    pair: TwoStrings;

    init() {
        self.pair = TwoStrings{
            s1: "h1",
            s2: "h2",
        };
    }
}