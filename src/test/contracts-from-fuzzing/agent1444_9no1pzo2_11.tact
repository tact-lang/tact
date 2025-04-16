struct Strings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StringFields {
    stuff: Strings;

    init() {
        self.stuff = Strings{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four",
        };
    }
}
