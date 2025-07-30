struct MultipleStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TextTriplet {
    content: MultipleStrings;

    init() {
        self.content = MultipleStrings{
            s1: "abc",
            s2: "def",
            s3: "ghi"
        };
    }
}