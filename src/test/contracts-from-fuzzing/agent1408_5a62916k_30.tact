struct MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: Int? = null;
    d: Bool? = null;
}

contract TestContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a: 42,
            b: true,
            c: 100,
            d: false,
        };
    }
}