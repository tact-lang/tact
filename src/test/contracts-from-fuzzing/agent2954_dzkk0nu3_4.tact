struct InnerOptional {
    description: String?;
    count: Int;
}

contract OptionalStructTest {
    info: InnerOptional;

    init() {
        self.info = InnerOptional{
            description: null,
            count: 99
        };
    }
}
