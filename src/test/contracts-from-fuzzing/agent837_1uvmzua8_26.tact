struct HasStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFields {
    x: HasStrings;
    init() {
        self.x = HasStrings{
            s1: "hello",
            s2: "there",
            s3: "world"
        };
    }
}