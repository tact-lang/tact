struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract ContractWithStrings {
    x: WithStrings;

    init() {
        self.x = WithStrings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma"
        };
    }
}