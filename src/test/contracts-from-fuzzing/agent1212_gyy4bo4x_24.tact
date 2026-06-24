struct Texts {
    a: String?;
    b: String;
    c: String?;
    d: String;
}

contract OptionalStrings {
    s: Texts;
    init() {
        self.s = Texts{
            a:null,
            b:"b",
            c:null,
            d:"d"
        };
    }
}