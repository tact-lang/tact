struct DefaultedOptional {
    data: Int? = null;
    text: String = "hi";
}

contract TestDefaultedOptional {
    st: DefaultedOptional;
    init() {
        self.st = DefaultedOptional{
            data: 42,
            text: "hello",
        };
    }
}
