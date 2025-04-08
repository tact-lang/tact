struct Strings {
    s1: String;
    s2: String;
    s3: String?;
}

contract StringStorage {
    texts: Strings;
    init() {
        self.texts = Strings{
            s1: "Alpha",
            s2: "Beta",
            s3: null
        };
    }
}