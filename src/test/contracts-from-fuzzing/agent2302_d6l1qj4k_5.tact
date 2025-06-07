struct OptionalNesting {
    nested: Int?;
    flag: Bool;
    text: String;
}

contract OptionalTest {
    data: OptionalNesting;

    init() {
        self.data = OptionalNesting{
            nested: null,
            flag: true,
            text: "optional"
        };
    }
}
