struct MultiString {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract ManyStrings {
    content: MultiString;

    init() {
        self.content = MultiString{
            a: "a",
            b: "b",
            c: "c",
            d: "d"
        };
    }
}