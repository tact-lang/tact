struct FlatDefaults {
    a: Int = 5;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;
}

contract ContractFlatDefaults {
    x: FlatDefaults = FlatDefaults{};
}