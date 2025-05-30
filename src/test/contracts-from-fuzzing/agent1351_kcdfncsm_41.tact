struct MultiDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = false;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
}

contract DefOptMix {
    val: MultiDefaults = MultiDefaults{};
}