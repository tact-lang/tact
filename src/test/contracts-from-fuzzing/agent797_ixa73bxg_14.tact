struct InnerMix {
    foo: Int? = null;
    bar: Bool? = null;
}

struct OuterMix {
    x: Int;            // required
    y: InnerMix?;      // optional nested struct
    s: String? = null; // optional default null
}

contract TestMixInit {
    storage: OuterMix = OuterMix{
        x: 42,
        y: null
    };

    init() {}
}