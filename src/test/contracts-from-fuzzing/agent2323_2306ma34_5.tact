struct OptionString {
    content: String?;
}

contract OptStringTest {
    field: OptionString;

    init() {
        self.field = OptionString{
            content: "hello"
        };
    }
}