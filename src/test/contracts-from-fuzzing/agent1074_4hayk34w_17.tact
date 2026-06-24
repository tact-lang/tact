struct WithString {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiStringTest {
    data: WithString;

    init() {
        self.data = WithString {
            s1: "hello",
            s2: "world",
            s3: "!"
        };
    }
}