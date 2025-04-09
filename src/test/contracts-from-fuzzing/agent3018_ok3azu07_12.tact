struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BoolContract {
    flags: BoolDefaults = BoolDefaults{};
}
