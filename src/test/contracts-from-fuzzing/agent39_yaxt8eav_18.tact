struct HasStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
    e: String;
}

contract ManyStrings {
    field: HasStrings;

    init() {
        self.field = HasStrings{
            a: "A",
            b: null,
            c: "C",
            d: null,
            e: "E",
        };
    }
}