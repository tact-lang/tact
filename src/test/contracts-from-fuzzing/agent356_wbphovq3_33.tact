struct OptionsAndStrings {
    foo: String?;
    bar: Bool?;
    baz: Int?;
}

contract MixedNullableTest {
    mixed: OptionsAndStrings;

    init() {
        self.mixed = OptionsAndStrings{
            foo:null,
            bar:null,
            baz:null
        };
    }
}