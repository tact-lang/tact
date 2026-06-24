struct MultiStrings {
    first: String;
    second: String;
    third: String;
    fourth: String;
}

contract ManyStrings {
    s: MultiStrings;

    init() {
        self.s = MultiStrings{
            first: "one",
            second: "two",
            third: "three",
            fourth: "four",
        };
    }
}