struct NestedWithBuilder {
    builder: Builder;
    text: String;
}

contract BuilderStructTest {
    data: NestedWithBuilder;

    init() {
        self.data = NestedWithBuilder{
            builder: beginCell(),
            text: "abc",
        };
    }
}