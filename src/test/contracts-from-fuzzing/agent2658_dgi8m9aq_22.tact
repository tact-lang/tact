struct WithDefaults {
    x: Int = 5;
    y: String = "str";
    z: Bool = false;
}

contract StructDefaultOverride {
    s: WithDefaults = WithDefaults{};
}