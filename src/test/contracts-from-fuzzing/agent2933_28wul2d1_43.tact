struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = false;
}

contract OptionalChainDefaultAll {
    f: OptionalDefaults = OptionalDefaults{};
}