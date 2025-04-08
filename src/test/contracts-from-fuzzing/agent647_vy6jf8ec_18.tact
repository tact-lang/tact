struct MultiString {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiStringTest {
    ms: MultiString;

    init() {
        self.ms = MultiString{ s1:"a", s2:"b", s3:"c" };
    }
}