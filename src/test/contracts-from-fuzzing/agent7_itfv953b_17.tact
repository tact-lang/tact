struct WithStrings {
    s1: String;
    s2: String?;
}

contract StringsTest {
    data: WithStrings;

    init() {
        self.data = WithStrings{ s1: "foo", s2: null };
    }
}