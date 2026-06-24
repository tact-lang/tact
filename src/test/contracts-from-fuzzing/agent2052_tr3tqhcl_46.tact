struct HasBoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BoolDefaultsTest {
    data: HasBoolDefaults = HasBoolDefaults{};
}