struct HasDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultFields {
    persistent: HasDefaults = HasDefaults{};
    init() {}
}