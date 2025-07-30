struct OptionalDefaults {
    msg: String? = null;
    flag: Bool? = null;
}

contract Test {
    data: OptionalDefaults = OptionalDefaults{};
}