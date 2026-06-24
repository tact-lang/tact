struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStrings {
    strs: Strings;
    init() {
        self.strs = Strings{s1:"a", s2:"b", s3:"c"};
    }
}
