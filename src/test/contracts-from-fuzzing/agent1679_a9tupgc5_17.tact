struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";
    d: Address;
    e: Bool = false;
}

contract ManyDefaultsTest {
    s: ManyDefaults;

    init() {
        self.s = ManyDefaults{
            d: myAddress()
        };
    }

    receive() {}
}