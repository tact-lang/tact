struct HasDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
    d: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract DefaultsUsage {
    field: HasDefaults = HasDefaults{};

    init() {}
}