struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyTexts {
    txts: Strings;

    init() {
        self.txts = Strings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma"
        };
    }
}