struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStr {
    st: Strings;

    init() {
        self.st = Strings{
            s1: "abc",
            s2: "def",
            s3: "ghi"
        };
    }
}