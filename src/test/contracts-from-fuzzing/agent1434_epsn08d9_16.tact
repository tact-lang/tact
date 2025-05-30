struct WithDefault {
    a: Int = 42;
    b: String = "default";
    c: Bool? = null;
}

contract Test {
    val: WithDefault = WithDefault{};

    receive() {}
}