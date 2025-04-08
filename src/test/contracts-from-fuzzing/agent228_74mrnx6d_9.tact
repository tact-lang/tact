struct OnlyStrings {
    a: String = "a";
    b: String = "b";
    c: String = "c";
    d: String = "d";
    e: String = "e";
}

contract StringsContract {
    s: OnlyStrings;

    init() {
        self.s = OnlyStrings{
            a: "aa",
            b: "bb",
            c: "cc",
            d: "dd",
            e: "ee"
        };
    }
}