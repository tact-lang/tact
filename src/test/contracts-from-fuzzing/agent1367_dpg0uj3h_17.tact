struct OptionalText {
    t1: String?;
    t2: String?;
    t3: String?;
}

contract OptStrings {
    s: OptionalText;

    init() {
        self.s = OptionalText{
            t1: null,
            t2: null,
            t3: null,
        };
    }
}