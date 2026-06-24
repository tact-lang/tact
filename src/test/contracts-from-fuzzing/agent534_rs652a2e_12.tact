struct ContainsStr {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFields {
    data: ContainsStr;

    init() {
        self.data = ContainsStr{
            s1: "abc",
            s2: "def",
            s3: "ghi",
        };
    }
}