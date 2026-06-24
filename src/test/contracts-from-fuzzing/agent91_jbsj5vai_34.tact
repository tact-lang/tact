struct BigStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract MultiStrings {
    data: BigStrings;

    init() {
        self.data = BigStrings{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four"
        };
    }
}
