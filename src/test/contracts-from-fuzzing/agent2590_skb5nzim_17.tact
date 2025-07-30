struct DeepOptionalWithDefaults {
    foo: Foo?;
}

struct Foo {
    bar: Bar;
}

struct Bar {
    z: Int = 123;
}

contract OptionalDefaultsDeep {
    data: DeepOptionalWithDefaults;
    init() {
        self.data = DeepOptionalWithDefaults{ foo: null };
    }
}