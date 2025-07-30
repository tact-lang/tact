struct StrHolder {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStrings {
    holder: StrHolder;

    init() {
        self.holder = StrHolder{
            s1: "abc",
            s2: "def",
            s3: "ghi"
        };
    }
}