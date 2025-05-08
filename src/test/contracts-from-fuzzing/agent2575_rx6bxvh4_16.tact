struct BoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract TestContract {
    bd: BoolDefaults = BoolDefaults{};
}