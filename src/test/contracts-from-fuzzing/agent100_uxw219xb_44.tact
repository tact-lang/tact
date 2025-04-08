struct OptWithDefaults {
    x: Int? = null;
    s: String? = null;
    f: Bool? = null;
}

contract DefaultOptionals {
    d: OptWithDefaults = OptWithDefaults{};
}