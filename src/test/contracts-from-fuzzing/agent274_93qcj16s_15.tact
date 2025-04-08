struct MultipleStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsMixTest {
    bundle: MultipleStrings;

    init() {
        self.bundle = MultipleStrings{
            s1: "one",
            s2: "two",
            s3: "three",
        };
    }
}