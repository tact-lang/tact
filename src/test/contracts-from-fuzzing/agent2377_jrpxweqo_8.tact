struct EmbeddedStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsInStorage {
    data: EmbeddedStrings;

    init() {
        self.data = EmbeddedStrings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma",
        };
    }
}