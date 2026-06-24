struct HasEmptyOptional {
    optStr: String?;
}

contract OptionalDefaultTest {
    content: HasEmptyOptional;

    init() {
        self.content = HasEmptyOptional{}; // omit optStr -> should default null
    }

    receive() {}
}