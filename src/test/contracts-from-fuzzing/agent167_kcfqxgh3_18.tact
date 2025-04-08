struct StrOpts {
    a: String?;
    b: String?;
    c: String?;
    d: String?;
}

contract ManyStringOptionals {
    s: StrOpts;

    init() {
        self.s = StrOpts{
            a: "1",
            b: "2",
            c: "3",
            d: "4"
        };
    }
}