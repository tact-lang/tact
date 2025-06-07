struct Texts {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStrings {
    texts: Texts;
    init() {
        self.texts = Texts{ s1:"a", s2:"b", s3:"c" };
    }
}