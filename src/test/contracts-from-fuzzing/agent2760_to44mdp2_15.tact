struct WithDefaults {
    a: Int = 1;
    b: Int? = null;
    c: Bool = false;
}

contract OnlyDefaults {
    val: WithDefaults = WithDefaults{};
}