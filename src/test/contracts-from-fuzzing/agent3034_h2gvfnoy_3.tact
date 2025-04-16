struct WithOptionals {
    name: String = "Test";
    value: Int?;
    flag: Bool?;
}

contract OptionalTest {
    item: WithOptionals;

    init() {
        self.item = WithOptionals{
            value: null,
            flag: true
        };
    }
}