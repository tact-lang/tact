struct StrNest {
    s1: String;
    s2: String;
    s3: String;
}

contract Stringy {
    sn: StrNest;

    init() {
        self.sn = StrNest{
            s1: "a",
            s2: "b",
            s3: "c",
        };
    }
}