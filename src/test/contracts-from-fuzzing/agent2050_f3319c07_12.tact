struct BigStringFields {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract StringStore {
    strings: BigStringFields;

    init() {
        self.strings = BigStringFields{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four",
            s5: "five"
        };
    }
}