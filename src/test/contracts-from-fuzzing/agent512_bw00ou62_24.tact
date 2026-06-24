struct LargeStringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract MultipleStringsTest {
    data: LargeStringFields;

    init() {
        self.data = LargeStringFields{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}