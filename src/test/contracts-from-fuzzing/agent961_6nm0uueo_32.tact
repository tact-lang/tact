struct StringPair {
    s1: String;
    s2: String;
}

contract StringPairContract {
    pair: StringPair;

    init() {
        self.pair = StringPair { s1: "a", s2: "b" };
    }
}