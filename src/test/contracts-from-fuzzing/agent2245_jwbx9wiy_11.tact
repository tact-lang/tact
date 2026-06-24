struct Texts {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract FuzzTest {
    texts: Texts;

    init() {
        self.texts = Texts{
            s1:"a",s2:"bb",s3:"ccc",s4:"dddd"
        };
    }
}
