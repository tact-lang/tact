struct HasMultipleStrings {
    one: String;
    two: String;
    three: String;
}

contract MultStringStruct {
    s: HasMultipleStrings;
    init() {
        self.s = HasMultipleStrings {
            one: "first",
            two: "second",
            three: "third"
        };
    }
}