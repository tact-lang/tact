struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract StringsBundle {
    ms: ManyStrings;

    init() {
        self.ms = ManyStrings{
            a: "one",
            b: "two",
            c: "three",
            d: "four",
            e: "five"
        };
    }
}