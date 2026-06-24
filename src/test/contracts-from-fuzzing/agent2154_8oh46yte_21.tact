struct OptionalStrings {
    a: String?;
    b: String?;
    c: String?;
}

contract OptStr {
    x: OptionalStrings;

    init() {
        self.x = OptionalStrings{a:null,b:"hi",c:null};
    }
}