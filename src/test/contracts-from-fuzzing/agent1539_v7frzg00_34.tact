struct HasString {
    s1: String;
    s2: String;
    s3: String;
}
contract MultiString {
    str: HasString;
    init() {
        self.str = HasString{s1: "a", s2: "b", s3:"c"};
    }
}