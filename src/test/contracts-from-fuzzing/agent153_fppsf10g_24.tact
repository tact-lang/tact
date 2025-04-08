struct JustStrings {
    a: String;
    b: String;
    c: String;
}

contract ManyStrings {
    s: JustStrings;

    init() {
        self.s = JustStrings{
            a: "foo",
            b: "bar",
            c: "baz"
        };
    }

    receive() {}
}