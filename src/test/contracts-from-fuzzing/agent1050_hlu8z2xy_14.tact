struct Texts {
    txt1: String;
    txt2: String?;
}

contract ManyTexts {
    s: Texts;

    init() {
        self.s = Texts{
            txt1: "hello",
            txt2: "world",
        };
    }
}
