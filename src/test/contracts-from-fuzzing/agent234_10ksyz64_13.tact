struct WithString {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStructTest {
    field: WithString;

    init() {
        self.field = WithString{ s1:"a", s2:"b", s3:"c" };
    }
}