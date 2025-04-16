struct HasDefaults {
    a: Int = 1;
    s: String = "hello";
    b: Bool = true;
}

contract DefVals {
    f: HasDefaults = HasDefaults{};
}
