struct MultiString {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFields {
    data: MultiString;

    init() {
        self.data = MultiString{
            s1: "abc",
            s2: "def",
            s3: "ghi",
        };
    }
}