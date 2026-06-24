struct MultiStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract OptStrings {
    texts: MultiStrings;

    init() {
        self.texts = MultiStrings{
            s1: null,
            s2: "hi",
            s3: null,
            s4: "yo",
            s5: null,
        };
    }
}