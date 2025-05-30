struct SStringOpt {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
}

contract ManyOptStrings {
    strs: SStringOpt;

    init() {
        self.strs = SStringOpt{
            s1: null,
            s2: null,
            s3: null,
            s4: null,
        };
    }
}
