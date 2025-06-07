struct Comp {
    foo: Int = 0;
    bar: Bool?;
    baz: String = "baz";
    qux: Bool?;
}

contract MixedDefaults {
    storage: Comp;

    init() {
        self.storage = Comp{
            foo: 123,
            bar: true,
            baz: "hello",
            qux: null,
        };
    }
}