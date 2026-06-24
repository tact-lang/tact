struct MultiOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract ManyOptionalFieldsContract {
    s: MultiOptional;

    init() {
        self.s = MultiOptional{
            foo: null,
            bar: null,
            baz: null
        };
    }
}