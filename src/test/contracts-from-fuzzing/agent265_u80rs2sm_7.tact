struct Texts {
    first: String;
    second: String;
    third: String;
}

contract TextArray {
    texts: Texts;

    init() {
        self.texts = Texts{
            first: "one",
            second: "two",
            third: "three"
        };
    }

    receive() {
        self.texts = self.texts;
    }
}