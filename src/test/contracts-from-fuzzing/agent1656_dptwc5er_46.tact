struct DefaultVsOverride {
    foo: Int = 3;
    bar: String = "abc";
}

contract OverrideDefaultsTest {
    data: DefaultVsOverride;

    init() {
        self.data = DefaultVsOverride{
            foo: 42,
            bar: "xyz"
        };
    }
}
