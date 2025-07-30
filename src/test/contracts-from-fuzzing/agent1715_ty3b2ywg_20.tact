struct OptionalsAndDefaults {
    x: Int? = 42;
    y: Bool? = null;
    z: String? = "default";
}

contract TestContract {
    s: OptionalsAndDefaults = OptionalsAndDefaults{};
}