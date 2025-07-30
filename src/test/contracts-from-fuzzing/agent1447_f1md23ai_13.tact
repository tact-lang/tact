struct TextHolder {
    a: String;
    b: String?;
    c: String;
}

contract StringsInside {
    t: TextHolder;
    extra: String?;

    init() {
        self.t = TextHolder{ a: "a", b: null, c: "c" };
        self.extra = "out";
    }
}