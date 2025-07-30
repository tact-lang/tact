struct HasStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract ContractWithStrings {
    embedded: HasStrings;

    init() {
        self.embedded = HasStrings{s1: "one", s2: "two", s3: "three"};
    }
}
