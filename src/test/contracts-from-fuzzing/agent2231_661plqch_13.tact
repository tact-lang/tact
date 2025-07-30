struct StringNest {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringNestingContract {
    sn: StringNest;

    init() {
        self.sn = StringNest{
            s1: "A",
            s2: null,
            s3: "B",
            s4: null,
        };
    }
}