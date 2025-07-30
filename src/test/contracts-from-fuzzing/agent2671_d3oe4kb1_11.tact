struct ManyStrings {
    first: String;
    second: String;
    third: String;
    fourth: String;
    fifth: String;
}

contract LotsOfStrings {
    texts: ManyStrings;

    init() {
        self.texts = ManyStrings{
            first: "one",
            second: "two",
            third: "three",
            fourth: "four",
            fifth: "five"
        };
    }
}