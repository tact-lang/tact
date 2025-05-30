struct MixOptionalDefaults {
    a: Int = 42;
    b: Bool?;
    c: String? = null;
    d: Address;
    e: String;
}

contract MixOptionalDefaultsTest {
    data: MixOptionalDefaults;

    init() {
        self.data = MixOptionalDefaults{
            b: null,
            d: myAddress(),
            e: "abc"
        };
    }
}
