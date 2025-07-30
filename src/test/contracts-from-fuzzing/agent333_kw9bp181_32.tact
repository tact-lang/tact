struct HasDefaults {
    i: Int = 42;
    b: Bool = true;
}

contract TestContract {
    hd: HasDefaults = HasDefaults{};
}