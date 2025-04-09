struct EmptyStr {
    text: String;
}

contract TestContract {
    s1: String;
    s2: String?;
    s3: EmptyStr?;

    init() {
        self.s1 = "";
        self.s2 = null;
        self.s3 = null;
    }
}