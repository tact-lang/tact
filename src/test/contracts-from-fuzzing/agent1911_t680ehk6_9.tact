struct Strings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract BigStrings {
    data: Strings;

    init() {
        self.data = Strings{
            s1: "s1",
            s2: "s2",
            s3: "s3",
            s4: "s4",
            s5: "s5"
        };
    }
}