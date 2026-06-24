struct MultiStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LotsOfStrings {
    data: MultiStrings;

    init() {
        self.data = MultiStrings {
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four",
        };
    }
}