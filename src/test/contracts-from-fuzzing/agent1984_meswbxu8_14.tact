struct HasStrings {
    a: String;
    b: String?;
    c: Int;
}

contract WithStrings {
    s: HasStrings;

    init() {
        self.s = HasStrings{
            a: "test",
            b: null,
            c: 123,
        };
    }
}