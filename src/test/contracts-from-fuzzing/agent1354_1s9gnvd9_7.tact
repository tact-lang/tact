struct DeeplyOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct HasDeeplyOptional {
    inner: DeeplyOptional;
    extra: Int;
}

contract TestContract {
    config: HasDeeplyOptional;

    init() {
        self.config = HasDeeplyOptional{
            inner: DeeplyOptional{
                foo: 7,
                bar: null,
                baz: "hello"
            },
            extra: 42
        };
    }
}