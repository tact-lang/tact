struct MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: Int?; // no default, implicitly null
    d: Bool? = null;
    e: Int = 8;
}

contract DefaultStructStore {
    data: MixedDefaults = MixedDefaults{
        b: true, e: 10
    };

    init() {
        self.data = MixedDefaults{
            a: 20,
            b: false,
            c: 3,
            d: true,
            e: 30
        };
    }
}