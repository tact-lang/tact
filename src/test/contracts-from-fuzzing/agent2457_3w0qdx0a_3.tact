struct WithOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsTest {
    data: WithOptional;

    init() {
        self.data = WithOptional{a: null, b: true, c: null};
    }
}