struct HasStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiStrings {
    textData: HasStrings;

    init() {
        self.textData = HasStrings{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}
