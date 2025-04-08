struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract ManyStringFields {
    vals: ManyStrings;

    init() {
        self.vals = ManyStrings{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four"
        };
    }
}