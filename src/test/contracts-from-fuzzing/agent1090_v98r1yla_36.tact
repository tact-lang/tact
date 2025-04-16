struct WithDefaults {
    a: Int = 42;
    b: Bool? = null;
    s: String = "hi";
}

contract ParamsWithDefaults(
    config: WithDefaults,
) {}
