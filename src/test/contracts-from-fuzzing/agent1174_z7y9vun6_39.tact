struct WithDefaults {
    a: Int = 2;
}

contract MissingInitAllowedFixed {
    f: WithDefaults = WithDefaults{};
}