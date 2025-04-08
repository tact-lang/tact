struct WithStrings {
    str1: String;
    str2: String?;
    num: Int;
}

contract StringFieldsTest {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            str1: "sample",
            str2: null,
            num: 100,
        };
    }
}