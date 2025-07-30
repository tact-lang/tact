struct TextData {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract TextStorage {
    contents: TextData;

    init() {
        self.contents = TextData{
            s1: "First",
            s2: null,
            s3: "Second",
            s4: "Third",
        };
    }
}