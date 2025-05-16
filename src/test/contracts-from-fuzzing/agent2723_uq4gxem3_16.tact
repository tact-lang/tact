struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFields {
    strings: Strings;
    init() {
        self.strings = Strings {
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}