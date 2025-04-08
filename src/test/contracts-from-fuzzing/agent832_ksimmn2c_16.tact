struct MultiString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
}

contract LongStrings {
    data: MultiString;

    init() {
        self.data = MultiString{
            s1: "a",
            s2: "bb",
            s3: "ccc",
            s4: "dddd",
            s5: "eeeee",
            s6: "ffffff",
        };
    }
}