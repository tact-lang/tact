struct DefaultsAndOpts {
    a: Int?;
    b: Int = 1;
    c: Bool?;
    d: Bool = false;
    e: String?;
    f: String = "x";
}

contract MixOptionsDefaults {
    store: DefaultsAndOpts = DefaultsAndOpts{
        a: null,
        c: null,
        e: null
    };

    init() {}
}