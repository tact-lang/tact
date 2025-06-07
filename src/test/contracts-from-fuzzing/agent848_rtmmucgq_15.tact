struct MixOptDefaults {
    foo: Int = 5;
    bar: Int?;
    baz: String = "test";
    qux: Bool?;
}

contract MixedOptDefault {
    data: MixOptDefaults;

    init() {
        self.data = MixOptDefaults{
            foo: 42,
            bar: null,
            baz: "wow",
            qux: true
        };
    }
}