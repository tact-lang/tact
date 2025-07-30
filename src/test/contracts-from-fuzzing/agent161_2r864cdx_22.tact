struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultsEverywhere {
    val: ManyDefaults = ManyDefaults{};

    init() {}

    receive() {}
}