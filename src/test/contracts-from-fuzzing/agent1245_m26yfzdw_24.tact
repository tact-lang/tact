struct OptionalContainer {
    val: Int?;
    nested: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract OptFieldMix {
    container: OptionalContainer;

    init() {
        self.container = OptionalContainer{
            val: null,
            nested: Inner{ foo: 100, bar: true },
        };
    }
}
