struct WithStringFields {
    n1: String;
    n2: String?;
    n3: String = "test";
    b: Bool;
}

contract StringFieldsTest {
    val: WithStringFields;
    init() {
        self.val = WithStringFields {
            n1: "hello",
            n2: null,
            b: true,
        };
    }
}