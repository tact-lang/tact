struct WithOptional {
    maybeInt: Int?;
    maybeBool: Bool?;
    text: String;
}

contract OptionalFieldsTest {
    data: WithOptional;
    init() {
        self.data = WithOptional{ maybeInt: null, maybeBool: true, text: "hello" };
    }
}