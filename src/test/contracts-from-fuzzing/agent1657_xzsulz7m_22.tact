struct Texts {
    s1: String;
    s2: String;
    s3: String?;
    s4: String?;
}

contract TestContract {
    words: Texts;
    init() {
        self.words = Texts{
            s1: "hello",
            s2: "world",
            s3: null,
            s4: "!"
        };
    }
}