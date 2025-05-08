struct WithOptional {
    some: Int?;
    another: Bool?;
}

contract OptionalFieldsTest {
    data: WithOptional;

    init() {
        self.data = WithOptional{ some: null, another: true };
    }
}
