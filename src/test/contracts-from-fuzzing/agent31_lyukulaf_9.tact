struct Inner {
    foo: Int;
    bar: Bool?;
    baz: String;
}

contract MultipleOptionals {
    record: Inner;

    init() {
        self.record = Inner{
            foo: 1,
            bar: null,
            baz: "hello",
        };
    }
}
