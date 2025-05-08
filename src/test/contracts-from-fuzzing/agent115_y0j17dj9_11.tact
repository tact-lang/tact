struct NamedFields {
    foo: Int;
    bar: String;
    baz: Bool;
}

contract DefaultInit {
    data: NamedFields;

    init() {
        self.data = NamedFields{
            foo: 42,
            bar: "hello",
            baz: false
        };
    }
}