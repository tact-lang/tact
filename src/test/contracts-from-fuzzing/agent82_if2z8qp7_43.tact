struct Texts {
    s1: String;
    s2: String = "hi";
    s3: String? = null;
}

contract Test {
    texts: Texts;

    init() {
        self.texts = Texts { s1: "a" };
    }
}