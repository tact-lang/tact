struct NestedStrings {
    first: String;
    second: String;
    third: String;
}

contract StringFields {
    text: NestedStrings;

    init() {
        self.text = NestedStrings{
            first: "A",
            second: "B",
            third: "C"
        };
    }
}