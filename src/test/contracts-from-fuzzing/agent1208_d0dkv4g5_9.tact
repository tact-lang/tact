struct StringPair {
    first: String;
    second: String?;
}

contract StringStructTest {
    info: StringPair;

    init() {
        self.info = StringPair{
            first: "primary",
            second: null
        };
    }
}