struct HasStrings {
    foo: String;
    bar: String?;
    baz: String;
}

contract StringsInState {
    data: HasStrings;

    init() {
        self.data = HasStrings{
            foo: "hello",
            bar: null,
            baz: "world"
        };
    }
}