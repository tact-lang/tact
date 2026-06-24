struct MultiString {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsSet {
    f: MultiString;

    init() {
        self.f = MultiString{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}