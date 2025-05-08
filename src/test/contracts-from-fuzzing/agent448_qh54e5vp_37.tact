struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract ParamWithDefaults(
    p: WithDefaults,
) {}