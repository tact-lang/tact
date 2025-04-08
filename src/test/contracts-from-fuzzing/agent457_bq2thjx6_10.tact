struct MultipleStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract Test {
    data: MultipleStrings;
    init() {
        self.data = MultipleStrings{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}