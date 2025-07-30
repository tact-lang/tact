struct HasBuilder {
    builder: Builder;
    str: String;
    number: Int;
}

contract TestHasBuilder {
    data: HasBuilder;

    init() {
        self.data = HasBuilder{
            builder: beginCell(),
            str: "ok",
            number: 123
        };
    }
}
