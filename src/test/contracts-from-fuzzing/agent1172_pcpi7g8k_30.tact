struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsHolder {
    f: Strings;

    init() {
        self.f = Strings{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}