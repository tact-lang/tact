struct HasManyStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStringsTest {
    strs: HasManyStrings;

    init() {
        self.strs = HasManyStrings{
            s1: "one",
            s2: "two",
            s3: "three",
        };
    }
}