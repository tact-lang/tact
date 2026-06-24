struct StringsOptional {
    foo: String?;
    bar: String?;
    baz: String?;
}

contract OptionalStringsStorageTest {
    data: StringsOptional;

    init() {
        self.data = StringsOptional{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}