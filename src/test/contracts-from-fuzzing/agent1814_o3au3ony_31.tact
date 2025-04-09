struct ManyStrings {
    a: String;
    b: String;
    c: String;
}

contract ManyStrFields {
    s: ManyStrings;

    init() {
        self.s = ManyStrings{
            a: "a",
            b: "b",
            c: "c"
        };
    }
}
