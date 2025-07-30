struct ComposeStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract MixStrings {
    x: ComposeStrings;

    init() {
        self.x = ComposeStrings {
            s1: "aa",
            s2: null,
            s3: "bb",
            s4: "cc"
        };
    }
}