struct WithDefaults {
    a: Int = 17;
    b: Bool? = null;
    c: String = "abc";
}

contract TestContract {
    wd: WithDefaults = WithDefaults{
        // omit 'b', use default null
        a: 11,
        c: "xyz"
    };
    init() {}
}