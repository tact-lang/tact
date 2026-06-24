struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract StringContract {
    textData: ManyStrings;

    init() {
        self.textData = ManyStrings{
            a: "one",
            b: "two",
            c: "three",
            d: "four",
            e: "five"
        };
    }
}
