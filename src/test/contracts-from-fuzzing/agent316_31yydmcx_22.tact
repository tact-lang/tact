struct OptStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptStrTest {
    data: OptStrings;

    init() {
        self.data = OptStrings{ s1: "hi", s2: null, s3: "bye" };
    }
}