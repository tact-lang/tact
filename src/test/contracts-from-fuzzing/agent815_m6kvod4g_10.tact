struct MixedDefaults {
    foo: Int = 5;
    bar: Bool;
    baz: String = "baz";
    qux: Address;
}

contract MixedDefaultsTest {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            foo: 10,
            bar: true,
            baz: "changed",
            qux: myAddress()
        };
    }
}