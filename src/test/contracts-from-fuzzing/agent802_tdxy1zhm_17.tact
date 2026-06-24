struct BigNested {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    opt1: String?;
    opt2: String?;
    opt3: String?;
    opt4: String?;
}

contract LotsOfStringFields {
    big: BigNested;

    init() {
        self.big = BigNested{
            s1: "a", s2: "b", s3: "c", s4: "d", s5: "e",
            opt1: null, opt2: "x", opt3: null, opt4: "y",
        };
    }
}