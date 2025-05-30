struct HasStr {
    s1: String;
    s2: String;
    s3: String;
}

contract C {
    d: HasStr;

    init() {
        self.d = HasStr{s1:"x", s2:"y", s3:"z"};
    }
}