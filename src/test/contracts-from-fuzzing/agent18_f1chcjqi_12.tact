struct TwoStrings {
    a: String;
    b: String;
}

contract StringPair {
    value: TwoStrings;
    init() {
        self.value = TwoStrings{ a:"One", b:"Two" };
    }
}