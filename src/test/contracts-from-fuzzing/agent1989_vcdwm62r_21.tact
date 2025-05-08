struct MixedDefaults {
    a: Int = 1;
    b: Int;
    c: Bool = true;
    d: Bool;
}

contract DefaultsMixTest {
    storage: MixedDefaults;

    init() {
        self.storage = MixedDefaults{
            b: 2,
            d: false,
        };
    }
}