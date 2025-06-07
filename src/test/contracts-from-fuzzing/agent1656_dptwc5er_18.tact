struct OptionalStringTest {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptStringContract {
    st: OptionalStringTest;

    init() {
        self.st = OptionalStringTest{
            s1: "hello",
            s2: null,
            s3: "world",
        };
    }
}
