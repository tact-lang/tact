struct ManyDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract StructDefaultsMix {
    s: ManyDefaults = ManyDefaults {
        o1: null,
        o2: null,
        o3: null
    };
    init() {}
}