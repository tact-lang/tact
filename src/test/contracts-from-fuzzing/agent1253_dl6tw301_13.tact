struct Strings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStrings {
    s: Strings;

    init() {
        self.s = Strings{
            a: "A", b: "B", c: "C", d: "D", e: "E"
        };
    }

    receive() {}
}