struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFields {
    data: Strings;

    init() {
        self.data = Strings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma"
        };
    }
}