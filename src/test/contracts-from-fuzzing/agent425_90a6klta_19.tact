struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract TestContract {
    val: WithDefaults = WithDefaults{};
}