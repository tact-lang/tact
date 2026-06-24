struct Stringy {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract ManyStrings {
    data: Stringy;

    init() {
        self.data = Stringy{
            a: "alpha",
            b: null,
            c: "gamma",
            d: null,
        };
    }
}