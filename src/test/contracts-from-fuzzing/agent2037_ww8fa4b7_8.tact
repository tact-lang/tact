struct WithStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract ManyStrings {
    store: WithStrings;

    init() {
        self.store = WithStrings{
            a: "one",
            b: "two",
            c: "three",
            d: "four"
        };
    }
}
