struct WithOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalFieldsTest {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            x: null,
            y: true,
            s: null
        };
    }
}