struct TwoStrings {
    first: String;
    second: String;
}

contract TwoStringsContract {
    pair: TwoStrings;

    init() {
        self.pair = TwoStrings{
            first: "hi",
            second: "bye"
        };
    }
}