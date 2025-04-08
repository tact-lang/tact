struct HasManyStrings {
    s1: String;
    s2: String;
    s3: String?;
    s4: String?;
}

contract StringsTest {
    data: HasManyStrings;

    init() {
        self.data = HasManyStrings{
            s1: "A",
            s2: "B",
            s3: null,
            s4: "D"
        };
    }
}