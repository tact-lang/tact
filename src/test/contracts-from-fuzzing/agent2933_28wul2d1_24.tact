struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = true;
    e: Int = 42;
    f: Bool = true;
}

contract DefaultStructs {
    s: ManyDefaults = ManyDefaults{};
}