struct StringTest {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    data: StringTest;
    
    init() {
        self.data = StringTest{s1: "abc", s2: "def", s3: "ghi"};
    }
}
