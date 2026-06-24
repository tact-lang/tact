struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
    d: Int? = null;
}

contract DefaultStructField {
    s: WithDefaults = WithDefaults{};
}