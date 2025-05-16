struct InnerOptional {
    name: String;
    flag: Bool;
}

struct OptionalNested {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    inner: InnerOptional?;
}

contract OptionalNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            foo: null,
            bar: null,
            baz: null,
            inner: null
        };
    }
}