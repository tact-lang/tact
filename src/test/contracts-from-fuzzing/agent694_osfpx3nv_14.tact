struct Strings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract TestContract {
    s: Strings;

    init() {
        self.s = Strings{
            a: "Alpha",
            b: null,
            c: "Gamma",
            d: "Delta"
        };
    }
}