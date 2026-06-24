struct DefaultsThenNonDefaults {
    foo: Int = 42;
    bar: Bool = false;
    baz: String;
}

contract MixedDefaults {
    data: DefaultsThenNonDefaults;

    init() {
        self.data = DefaultsThenNonDefaults{
            baz: "hi"
        };
    }
}