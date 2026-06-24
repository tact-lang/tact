struct MultiLayer {
    s1: String;
    s2: String;
    opt1: String?;
    opt2: String?;
}

contract OptionalStrings {
    val: MultiLayer;

    init() {
        self.val = MultiLayer{
            s1: "x",
            s2: "y",
            opt1: null,
            opt2: "zzz"
        };
    }
}