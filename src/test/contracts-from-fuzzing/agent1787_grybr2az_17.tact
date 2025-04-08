struct StringVariants {
    plain: String;
    optional: String?;
}

contract StringVariantsTest {
    data: StringVariants;

    init() {
        self.data = StringVariants{
            plain: "hello",
            optional: null
        };
    }
}