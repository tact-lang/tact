struct Texts {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsTest {
    texts: Texts;

    init() {
        self.texts = Texts{
            s1: "one",
            s2: "two",
            s3: "three",
        };
    }
}
