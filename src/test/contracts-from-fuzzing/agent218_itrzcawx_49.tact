struct TwoStrings {
    one: String;
    two: String;
}

contract StringTwins {
    s: TwoStrings;

    init() {
        self.s = TwoStrings{
            one: "111",
            two: "222"
        };
    }
}