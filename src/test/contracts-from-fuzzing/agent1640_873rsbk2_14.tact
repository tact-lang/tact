struct StringOptions {
    title: String? = null;
    message: String?;
    footer: String;
}

contract StringOptionalTest {
    s: StringOptions;

    init() {
        self.s = StringOptions{
            message: null,
            footer: "bye"
        };
    }
}