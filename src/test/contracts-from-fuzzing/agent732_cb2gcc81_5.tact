struct WithOptionals {
    foo: Int?;
    bar: Bool?;
    name: String?;
}

contract OptionalFieldsTest {
    storage: WithOptionals;

    init() {
        self.storage = WithOptionals{
            foo: null,
            bar: true,
            name: null
        };
    }
}