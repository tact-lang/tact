struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFields {
    data: Strings;

    init() {
        self.data = Strings{
            s1: "abc",
            s2: "def",
            s3: "ghi"
        };
    }
}