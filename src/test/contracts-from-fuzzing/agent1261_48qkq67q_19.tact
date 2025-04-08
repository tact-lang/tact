struct BigStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract LotsOfStrings {
    data: BigStrings;

    init() {
        self.data = BigStrings{
            s1: "a very very very very very long string for s1",
            s2: "another quite big string for s2",
            s3: "and yet another large text for s3"
        };
    }
}