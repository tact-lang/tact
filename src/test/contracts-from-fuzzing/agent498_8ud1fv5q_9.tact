struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    s: String = "abc";
    o: Int?;
}

contract DefaultsStorage {
    d: WithDefaults = WithDefaults{};
}