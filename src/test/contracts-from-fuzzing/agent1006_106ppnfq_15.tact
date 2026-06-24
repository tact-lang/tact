struct Strings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract TestContract {
    s: Strings;

    init() {
        self.s = Strings{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e"
        };
    }
}
