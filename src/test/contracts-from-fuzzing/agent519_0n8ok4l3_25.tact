struct WithString {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFieldsTest {
    data: WithString;

    init() {
        self.data = WithString{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}