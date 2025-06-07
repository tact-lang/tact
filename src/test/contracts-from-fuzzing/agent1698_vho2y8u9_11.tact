struct OptionalStrings {
    a: String?;
    b: String?;
    c: String?;
}

contract OptStrings {
    d: OptionalStrings;

    init() {
        self.d = OptionalStrings{a:null, b:null, c:"hi"};
    }
}