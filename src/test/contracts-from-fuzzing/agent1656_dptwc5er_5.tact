struct VeryLongStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestLongStrings {
    storage: VeryLongStrings;

    init() {
        self.storage = VeryLongStrings{
            s1: "a very very very very long string here",
            s2: "another significantly verbose string just to test",
            s3: "third extensive string with some unicode: 👾🧠🎉",
        };
    }
}
