struct WithStrings {
    a: String;
    b: String;
    c: String;
}

contract StringsAndOpts {
    s: WithStrings?;

    init() {
        self.s = null;
    }
}