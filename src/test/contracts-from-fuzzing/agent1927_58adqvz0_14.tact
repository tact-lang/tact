struct BigStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract LargeStringsTest {
    data: BigStrings;

    init() {
        self.data = BigStrings{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}