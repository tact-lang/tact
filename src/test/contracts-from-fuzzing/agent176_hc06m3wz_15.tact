struct MixedDefaults {
    a: Int = 0;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool? = null;
    f: String? = "q";
}

contract DefaultsMix {
    val: MixedDefaults = MixedDefaults{
        a: 10,
        b: true,
        c: "hi",
        d: null,
        e: true,
        f: null
    };

    init() {
        self.val = MixedDefaults{
            a: 20,
            b: false,
            c: "hello",
            d: 42,
            e: null,
            f: "bye"
        };
    }
}