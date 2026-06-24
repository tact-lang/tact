struct TwoStrings {
    a: String;
    b: String;
}

contract StringsInside {
    f: TwoStrings;

    init() {
        self.f = TwoStrings{ a: "abc", b: "def" };
    }
}