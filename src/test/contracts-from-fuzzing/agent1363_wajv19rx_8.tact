struct MixedDefaults {
    a: Int = 10;
    b: Bool? = null;
    c: String = "abc";
    d: String? = "hello";
}

contract DefaultsMix {
    value: MixedDefaults;

    init() {
        self.value = MixedDefaults{
            a: 42,
            b: true,
            c: "xyz",
            d: null,
        };
    }
}