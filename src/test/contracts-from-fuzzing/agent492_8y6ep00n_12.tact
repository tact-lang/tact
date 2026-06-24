struct HasStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    data: HasStrings;

    init() {
        self.data = HasStrings{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}