struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract TestContract {
    f: WithDefaults = WithDefaults{};
}