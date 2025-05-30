struct MultiStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract StringFields {
    data: MultiStrings;

    init() {
        self.data = MultiStrings{
            s1: "abc",
            s2: "def",
            s3: "ghi",
            s4: "jkl",
            s5: "mno",
        };
    }
}
