struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hey";
}

contract StructWithDefaults {
    s: WithDefaults = WithDefaults{};
}