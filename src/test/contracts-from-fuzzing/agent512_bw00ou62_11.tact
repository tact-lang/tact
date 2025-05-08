struct MixedOptionalDefaults {
    one: Int? = null;
    two: Bool = true;
    three: String?;
    four: Address;
}

contract MixedDefaultsTest {
    data: MixedOptionalDefaults;

    init() {
        self.data = MixedOptionalDefaults{
            four: myAddress(),
            three: null
        };
    }
}
