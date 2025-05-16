struct MultipleStrings {
    one: String;
    two: String;
    three: String;
    four: String;
}

contract StringTest {
    state: MultipleStrings;
    init() {
        self.state = MultipleStrings{
            one: "x",
            two: "y",
            three: "z",
            four: "w",
        };
    }
}