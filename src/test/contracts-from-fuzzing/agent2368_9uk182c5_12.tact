struct ManyOptionals {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract OptStrings {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            s1: null,
            s2: "a",
            s3: null,
            s4: "b",
            s5: null
        };
    }
}