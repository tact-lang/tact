struct SCollection {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract Test {
    bigS: SCollection;

    init() {
        self.bigS = SCollection{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d"
        };
    }
}