struct Strings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract StringFields {
    s: Strings;

    init() {
        self.s = Strings{
            a: "aa",
            b: null,
            c: "cc",
            d: "dd",
        };
    }
}