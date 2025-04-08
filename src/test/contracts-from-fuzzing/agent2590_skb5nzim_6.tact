struct JustStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStrings {
    data: JustStrings;
    init() {
        self.data = JustStrings{
            a: "A", b: "B", c: "C", d: "D", e: "E"
        };
    }
}