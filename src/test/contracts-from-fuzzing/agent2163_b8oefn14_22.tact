struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStringsContract {
    fields: ManyStrings;

    init() {
        self.fields = ManyStrings{
            a: "A",
            b: "B",
            c: "C",
            d: "D",
            e: "E"
        };
    }
}