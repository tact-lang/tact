struct StrNest {
    s1: String;
    s2: String;
    s3: String;
}

contract ContractWithStrings {
    data: StrNest;

    init() {
        self.data = StrNest{
            s1: "alpha",
            s2: "beta",
            s3: "gamma"
        };
    }
}
