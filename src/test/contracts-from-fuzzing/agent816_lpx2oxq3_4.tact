struct OptionalNested {
    inner: Int?;
    str: String;
    flag: Bool?;
}

contract OptNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null,
            str: "abc",
            flag: null,
        };
    }
}
