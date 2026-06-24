struct TextHeavy {
    s1: String;
    s2: String?;
    s3: String?;
    i: Int;
    j: Int as uint64;
}

contract TextHeavyContract {
    data: TextHeavy;

    init() {
        self.data = TextHeavy{
            s1: "A longish string here to test",
            s2: null,
            s3: null,
            i: 42,
            j: 44
        };
    }
}
