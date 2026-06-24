struct WithDefaults {
    a: Int = 17;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract TestContract {
    wd: WithDefaults = WithDefaults{};
    init() {}
}