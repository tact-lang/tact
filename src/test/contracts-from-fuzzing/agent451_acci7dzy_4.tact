struct WithOptionals {
    flag: Bool?;
    number: Int?;
    text: String?;
}

contract OptionalFieldsTest {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            flag: null,
            number: null,
            text: null,
        };
    }
}