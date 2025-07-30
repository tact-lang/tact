struct OptText {
    content: String?;
}

contract OptStringFields {
    a: String?;
    b: String;
    s: OptText;

    init() {
        self.a = null;
        self.b = "Hi";
        self.s = OptText{content: null};
    }
}